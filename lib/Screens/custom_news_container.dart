import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imversion/Screens/webview_screen.dart';
import 'package:imversion/models/article_model.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomNewContainer extends StatefulWidget {
  final Article article;

  const CustomNewContainer({Key? key, required this.article}) : super(key: key);

  @override
  State<CustomNewContainer> createState() => _CustomNewContainerState();
}

class _CustomNewContainerState extends State<CustomNewContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Get.to(()=>WebViewScreenNews(url: widget.article.url,title: widget.article.source.source,));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        height: size.height * 0.4,
        width: size.width * 0.3,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              )
            ]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.25,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.article.urlToImage), fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    color: Colors.deepPurpleAccent.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        textScaleFactor: 1.2,
                        widget.article.source.source,
                        style: GoogleFonts.lexendDeca(fontSize: 9),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
                child: Text(
                  widget.article.title,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 2,
                  style: GoogleFonts.lexendDeca(fontSize: 15),
                ),
              )
            ]),
      ),
    );
  }
}
