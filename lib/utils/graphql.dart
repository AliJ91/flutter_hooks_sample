import 'package:flutter/widgets.dart';

import 'package:graphql/client.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class GraphQLCustomProvider extends StatefulWidget {
  const GraphQLCustomProvider({
    Key? key,
    this.clients,
    this.child,
  }) : super(key: key);

  final Map<String, ValueNotifier<GraphQLClient>>? clients;
  final Widget? child;

  static ValueNotifier<GraphQLClient> of(BuildContext context, String key) =>
      _InheritedGraphQLCustomProvider.of(context, key).clients[key]!;

  @override
  State<StatefulWidget> createState() => _GraphQLCustomProviderState();
}

class _GraphQLCustomProviderState extends State<GraphQLCustomProvider> {
  void didValueChange() => setState(() {});

  @override
  void initState() {
    super.initState();

    widget.clients!.forEach((key, value) {
      value.addListener(didValueChange);
    });
  }

  @override
  void dispose() {
    widget.clients!.forEach((key, value) {
      value.removeListener(didValueChange);
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedGraphQLCustomProvider(
      clients: widget.clients!,
      child: widget.child!,
    );
  }
}

class _InheritedGraphQLCustomProvider extends InheritedWidget {
  _InheritedGraphQLCustomProvider({
    required this.clients,
    required Widget child,
  })  : clientValues = clients.map((key, value) => MapEntry(key, value.value)),
        super(child: child);

  factory _InheritedGraphQLCustomProvider.of(BuildContext context, String key) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<_InheritedGraphQLCustomProvider>();
    assert(provider != null);
    return provider!;
  }

  final Map<String, ValueNotifier<GraphQLClient>> clients;
  final Map<String, GraphQLClient> clientValues;

  @override
  bool updateShouldNotify(_InheritedGraphQLCustomProvider oldWidget) {
    return clientValues != oldWidget.clientValues;
  }
}

GraphQLClient useGraphQLCustomClient(String key) {
  final context = useContext();
  return useValueListenable(GraphQLCustomProvider.of(context, key));
}
