import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:work_shop/home/provider/home_provider.dart';
import 'package:work_shop/home/widgets/date_time.dart';
import 'package:work_shop/home/widgets/loading.dart';
import 'package:work_shop/route/app_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'New',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: dataProvider.data == null
          ? const Center(
              child: LoadingWidget(),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: dataProvider.data!.data!.length,
              itemBuilder: (context, index) {
                final item = dataProvider.data!.data![index];
                return GestureDetector(
                  onTap: () {
                    context.goNamed(Routes.movieDetail.name, extra: item.id);
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: item.image != null
                              ? Container(
                                  height: 100,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://public-kpv-bucket.s3.ap-southeast-1.amazonaws.com/resized/medium/${item.image}'),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                )
                              : SizedBox(), // Placeholder or default image
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                                // Spacer(),
                                DateTimeFormatter(
                                  dateTimeString: item.createdAt!,
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          child: Icon(Icons.chevron_right),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
