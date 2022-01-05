import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:exhibit_app/api/model/Exhibit.dart';
import 'package:exhibit_app/api/rest_loader/rest_exhibits_loader.dart';
import 'package:exhibit_app/pages/exhibit/components/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExhibitPage extends StatefulWidget {
  @override
  _ExhibitPageState createState() => _ExhibitPageState();
}

class _ExhibitPageState extends State<ExhibitPage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Exhibits"),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {  },
            )
          ],
          centerTitle: true,
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              setState(() {

              });
            },
            child: FutureBuilder<List<Exhibit>>(
              future: RestExhibitsLoader().getExhibitList(),
              builder: (BuildContext context, AsyncSnapshot<List<Exhibit>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator(),);
                  case ConnectionState.none:
                    return Center(child: Text("No data"));
                  case ConnectionState.active:
                    return SizedBox.shrink();
                  case ConnectionState.done:
                    if (snapshot.requireData.isEmpty) {
                      return Center(child: Text("No data"));
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Something went wrong"));
                    } else {
                      return buildContent(snapshot.requireData);
                    }
                }
              },
            ),
        )
    );
  }

  Widget buildContent(List<Exhibit> list) => ListView(
    physics: ClampingScrollPhysics(),
    children: list.map((e) =>
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(e.title!),
            ),
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.4,
                height: 150,
                // enableInfiniteScroll: false,
                onPageChanged: (n, reason) {

                },
              ),
              items: e.images!.map((imageUrl) {
                return Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 20),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        // width: MediaQuery.of(context).size.width,
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                          ),
                        ),
                      ),
                    ),
                    placeholder: (context, url) => CustomShimmer(),
                    errorWidget: (context, url, error) => CustomShimmer()
                  ),
                );
              }).toList(),
            ),
          ],
        )
    ).toList(),
  );
}