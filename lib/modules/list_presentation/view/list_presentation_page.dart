import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/list_presentation/cubit/list_presentation_cubit.dart';
import 'package:mhs_mobile/modules/list_presentation/model/gallery_item_model.dart';
import 'package:mhs_mobile/modules/list_presentation/view/fullscreen_presentation_page.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

List<String> listOfUrls= [
  "http://157.245.193.49:3099/mhs/file/3_0-1725350045035.jpg",
  "http://157.245.193.49:3099/mhs/image/presentasi/7_0-1725350317007.jpg",
];


class ListPresentationPage extends StatelessWidget {
  const ListPresentationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListPresentationCubit()..fetchPresentation(),
      child: const ListPresentationView(),
    );
  }
}

// to view image in full screen
class ListPresentationView extends StatefulWidget {

  const ListPresentationView({
    super.key,});

  @override
  State<StatefulWidget> createState() {
    return _ListPresentationViewState();
  }
}

class _ListPresentationViewState extends State<ListPresentationView> {
  late final PageController _controller =
      PageController(initialPage: 0);
  int _currentPage = 0;
  bool isScale = false;
  int zoom = 0;

  @override
  void initState() {
    _currentPage = 0;
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.toInt() ?? 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentPage = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListPresentationCubit, ListPresentationState>(
        // buildWhen: (previous, current) => previous.document != current.document,
        builder: (context, st) {
        return OrientationBuilder(
          builder: (context, orientation) {
            debugPrint("orientasi ? ${st.loadingPresentation}");
            return orientation == Orientation.landscape ? const FullScreenPresentationView() : AnnotatedRegion(
              value: SystemUiOverlayStyle.light,
              child: Scaffold(
                backgroundColor: whiteColor,
                appBar: AppBar(
                backgroundColor:primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
                ),
                title: const Text(
                  "Presentasi", 
                  style: TextStyle(
                    color: whiteColor,
                  ),
                ),
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: whiteColor,
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Container(
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(70))
                    ),
                  ),
                )
              ),
              floatingActionButton: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero
                ),
                onPressed: (){
                  FullScreenPresentationRoute().go(context);
                }, 
                child: const Icon(
                  Icons.fullscreen,
                  size: 30,
                )
              ),
              body: st.loadingPresentation ? const LoadingPage() : st.document.isEmpty ? const EmptyPage(msg: "Tidak ada presentasi") :  Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: PhotoViewGallery.builder(
                        backgroundDecoration: const BoxDecoration(
                          color: whiteColor
                        ),
                        scaleStateChangedCallback: (value) {},
                        onPageChanged: onPageChanged,
                        pageController: _controller,
                        scrollPhysics: const BouncingScrollPhysics(),
                        builder: (BuildContext context, int index) {
                          return PhotoViewGalleryPageOptions(
                            minScale: PhotoViewComputedScale.contained * 1,
                            maxScale: PhotoViewComputedScale.covered * 3,
                            onTapDown: (context, details, controllerValue) {
                              setState(() {
                                zoom = details.kind!.index;
                              });
                            },
                            imageProvider: Image.network(st.document[index].fileUrl ?? "", fit: BoxFit.contain).image,
                            initialScale: PhotoViewComputedScale.contained * 0.8,
                            heroAttributes: PhotoViewHeroAttributes(tag: st.document[index].id ?? ""),
                          );
                        },
                        itemCount: st.document.length,
                        loadingBuilder: (context, event) => Center(
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              value: event == null
                                  ? 0
                                  : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }

// build image with zooming
  Widget _buildImage(GalleryItemModel item) {
    return Hero(
      tag: item.id,
      child: Center(
        child: ImageCard(
          image: item.imageUrl,
          radius: 0, 
        ),
      ),
    );
  }

// build image with zooming
  Widget _buildLitImage(GalleryItemModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _controller.jumpToPage(item.index);
          });
        },
        child: ImageCard(
          height: _currentPage == item.index ? 70 : 60,
          width: _currentPage == item.index ? 70 : 60,
          fit: BoxFit.cover,
          image: item.imageUrl,
          radius: 10,
        ),
      ),
    );
  }
}