import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_api_call/post_model.dart';
import 'package:map_api_call/post_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderT;
  HomeProvider? homeProviderF;

  @override
  Widget build(BuildContext context) {
    homeProviderT = Provider.of<HomeProvider>(context, listen: true);
    homeProviderF = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Post map"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: homeProviderF!.getapiData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        subtitle:
                            Text("${homeProviderF!.postapiList[index].title}"),
                        title: Text("${homeProviderF!.postapiList[index].id}"),
                      );
                    },
                    itemCount: homeProviderF!.postapiList.length,
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    ));
  }
}
