import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:work_shop/home/provider/home_provider.dart';
import 'package:work_shop/home/widgets/loading.dart';


class HomeScreenDetail extends StatefulWidget {
  final String id;
  const HomeScreenDetail({super.key, required this.id});

  @override
  State<HomeScreenDetail> createState() => _HomeScreenDetailState();
}

class _HomeScreenDetailState extends State<HomeScreenDetail> {
  @override
  void initState() {
    log(widget.id);
    Provider.of<HomeProvider>(context, listen: false)
        .fetchDataDetail(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HomeProvider>(context);
    // final dataDetail = dataProvider.listDetail!.data;
    return Scaffold(
      // appBar: AppBar(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     context.read<HomeProvider>().fetchDataDetail(id: widget.id);
      //   },
      // ),
      body: dataProvider.listDetail == null
          ? const Center(child: LoadingWidget())
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 300,
                  leading: GestureDetector(
                    onTap: () {
                      context.go('/');
                    },
                    child:
                        const Icon(Icons.arrow_back_ios, color: Colors.black),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          // context.router
                        },
                        icon: const Icon(Icons.more_horiz),
                        color: Colors.white)
                  ],
                  stretch: true,
                  pinned: false,
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                      stretchModes: const [
                        StretchMode.zoomBackground,
                        StretchMode.blurBackground
                      ],
                      background: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://public-kpv-bucket.s3.ap-southeast-1.amazonaws.com/resized/medium/${dataProvider.listDetail!.data!.image}'),
                              fit: BoxFit.cover),
                        ),
                      )),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 22, left: 18, right: 22),
                    child: Column(
                      children: [
                        Text(dataProvider.listDetail!.data!.detail.toString()),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Wrap(
                            spacing: 4.0,
                            runSpacing: 4.0,
                            children: (dataProvider
                                        .listDetail?.data?.additionalInfo ??
                                    [])
                                .map((item) {
                              return Column(
                                children: item.image!.map((imageUrl) {
                                  return Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.network(
                                      'https://public-kpv-bucket.s3.ap-southeast-1.amazonaws.com/resized/medium/$imageUrl',
                                      // Adjust the width as needed
                                      fit: BoxFit.cover, // Adjust the image fit
                                    ),
                                  );
                                }).toList(),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
