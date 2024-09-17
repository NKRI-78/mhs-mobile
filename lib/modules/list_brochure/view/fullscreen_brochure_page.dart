import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/list_brochure/cubit/list_brocure_cubit.dart';
import 'package:mhs_mobile/modules/list_presentation/cubit/list_presentation_cubit.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenBrochurePage extends StatelessWidget {
  const FullScreenBrochurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBrocureCubit()..fetchBrochure(),
      child: const FullScreenPresentationView(),
    );
  }
}

class FullScreenPresentationView extends StatefulWidget {
  const FullScreenPresentationView({super.key});

  @override
  State<FullScreenPresentationView> createState() => _FullScreenPresentationViewState();
}

class _FullScreenPresentationViewState extends State<FullScreenPresentationView> {
  late final PageController _controller =
      PageController(initialPage: 0);
  int _currentPage = 0;
  bool isScale = false;
  int zoom = 0;

  @override
  void initState() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);
    _currentPage = 2;
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.toInt() ?? 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    bool isScale = false;
    _controller.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentPage = index; 
      isScale = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBrocureCubit, ListBrocureState>(
        // buildWhen: (previous, current) => previous.document != current.document,
        builder: (context, st) {
        return OrientationBuilder(
          builder: (context, orientation) {
            if(orientation == Orientation.landscape){
              
            }
            return Scaffold(
              backgroundColor: whiteColor,
            body: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: PhotoViewGallery.builder(
                      backgroundDecoration: const BoxDecoration(
                        color: whiteColor
                      ),
                      scaleStateChangedCallback: (value) {
                        debugPrint("Callback : ${value.index}");
                        setState(() {
                          isScale = value.isScaleStateZooming;
                          zoom = value.index;
                        });
                      },
                      onPageChanged: onPageChanged,
                      pageController: _controller,
                      scrollPhysics: const BouncingScrollPhysics(),
                      builder: (BuildContext context, int index) {
                        return PhotoViewGalleryPageOptions(
                          minScale: PhotoViewComputedScale.contained * 1,
                                  maxScale: PhotoViewComputedScale.covered * 3,
                          onTapDown: (context, details, controllerValue) {
                            setState(() {
                              debugPrint("Zoom Tap: ${details.kind!.index}");
                              zoom = details.kind!.index;
                            });
                          },
                          onTapUp: (context, details, controllerValue) {
                            isScale = false;
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
                  isScale == true || zoom >= 1 ? Container() : Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: (){
                        _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInBack);
                      }, 
                      icon: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          size: 50,
                          color: whiteColor.withOpacity(0.5),
                        ),
                      )
                    )
                  ),
                  isScale == true || zoom >= 1 ? Container() : Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: (){
                        _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                      }, 
                      icon: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_left_sharp,
                          size: 50,
                          color: whiteColor.withOpacity(0.5),
                        ),
                      )
                    )
                  ),
                  isScale == true || zoom >= 1 ? Container() : Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: IconButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        }, 
                        icon: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: redColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.fullscreen_exit,
                            size: 50,
                            color: whiteColor.withOpacity(0.5),
                          ),
                        )
                      ),
                    )
                  )
                ],
              ),
            );
          }
        );
      }
    );
  }
}