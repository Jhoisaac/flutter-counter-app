import 'package:counter_stream/bloc/bloc_base.dart';
import 'package:flutter/material.dart';

/*typedef BlocBuilder<T> = T Function();*/
/*typedef BlocDisposer<T> = Function(T);*/

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  const BlocProvider({ Key key, @required this.child, @required this.bloc, /*this.blocDispose,*/})
      : super(key: key);

  final Widget child;
  final T bloc;
  /*final BlocDisposer<T> blocDispose;*/

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context){
    _BlocProviderInherited<T> provider = context.getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>()?.widget;

    return provider?.bloc;
  }
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>>{

  T bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.bloc/*()*/;
  }

  @override
  void dispose(){
    /*if (widget.blocDispose != null){
      widget.blocDispose(bloc);
    } else {
      bloc?.dispose();
    }*/

    bloc?.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    return new _BlocProviderInherited<T>(
      bloc: bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  _BlocProviderInherited({
    Key key,
    @required Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}