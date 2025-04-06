import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:program/pages/add_product_page.dart';
import 'package:program/blocs/product/product_bloc.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Porduct App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      home: BlocProvider(
        create:(_)=>ProductBloc(),
        child:AddProductPage(),
      ),
    );

  }
}