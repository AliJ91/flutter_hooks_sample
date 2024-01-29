

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_sample/lifecycle/use-jwt-token.dart';
import 'package:flutter_hooks_sample/utils/graphql.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLWidget extends HookWidget {
  const GraphQLWidget({
    Key? key,
    required this.realtimeUrl,
    required this.mainAppUrl,
    required this.realtimeWssUrl,
    required this.mainAppWssUrl,
    required this.child,
  }) : super(key: key);

  final String realtimeUrl;
  final String mainAppUrl;
  final String realtimeWssUrl;
  final String mainAppWssUrl;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final jwtToken = useJwtToken();
    var mainAppLink = useMemoized(() {


      final httpLink = HttpLink(
        mainAppUrl,
        defaultHeaders: {
          "":""
        },
      );
      final authLink = AuthLink(
        getToken: () async => 'Bearer ${jwtToken!.accessToken}',
      );
      var link = authLink.concat(httpLink);

      final websocketLink = WebSocketLink(
        mainAppWssUrl,
        subProtocol: GraphQLProtocol.graphqlTransportWs,
        config: SocketClientConfig(
          inactivityTimeout: const Duration(seconds: 30),
          delayBetweenReconnectionAttempts: const Duration(seconds: 10),
          initialPayload: {
            'Authorization': 'Bearer ${jwtToken!.accessToken}',

          },
          headers: {
            'Authorization': 'Bearer ${jwtToken.accessToken}',

          },
        ),
      );

      link = Link.split(
            (request) => request.isSubscription,
        websocketLink,
        link,
      );

      return link;
    }, [jwtToken]);

    var realtimeAppLink = useMemoized(() {


      final httpLink = HttpLink(realtimeUrl);
      final authLink = AuthLink(
        getToken: () async => 'Bearer ${jwtToken!.accessToken}',
      );
      var link = authLink.concat(httpLink);

      final websocketLink = WebSocketLink(
        realtimeWssUrl,
        subProtocol: GraphQLProtocol.graphqlTransportWs,
        config: SocketClientConfig(
          inactivityTimeout: const Duration(seconds: 30),
          delayBetweenReconnectionAttempts: const Duration(seconds: 10),
          initialPayload: {
            'Authorization': 'Bearer ${jwtToken!.accessToken}',
          },
          headers: {
            'Authorization': 'Bearer ${jwtToken.accessToken}',
          },
        ),
      );

      link = Link.split(
            (request) => request.isSubscription,
        websocketLink,
        link,
      );

      return link;
    }, [jwtToken]);

    final mainAppClient = useMemoized(
            () => ValueNotifier<GraphQLClient>(
          GraphQLClient(
            cache: GraphQLCache(store: HiveStore()),
            defaultPolicies: DefaultPolicies(
              query: Policies(
                fetch: FetchPolicy.networkOnly,
              ),
            ),
            link: mainAppLink,
          ),
        ),
        [mainAppLink]);

    final realtimeAppClient = useMemoized(
            () => ValueNotifier<GraphQLClient>(
          GraphQLClient(
            cache: GraphQLCache(store: HiveStore()),
            defaultPolicies: DefaultPolicies(
              query: Policies(
                fetch: FetchPolicy.networkOnly,
              ),
            ),
            link: realtimeAppLink,
          ),
        ),
        [realtimeAppLink]);

    return GraphQLProvider(
      client: mainAppClient,
      child: GraphQLCustomProvider(
        clients: {'main': mainAppClient, 'realtime': realtimeAppClient},
        child: CacheProvider(
            child:
            child

        ),
      ),
    );
  }
}
