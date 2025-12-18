
import 'package:flutter/material.dart';
import 'package:project_out_of_bed/ComponentReuse/app_bar_logo.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: const Size.fromHeight(200), 
        child: AppBarLogo()
        )
      );}
}