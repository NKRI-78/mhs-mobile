import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/list_brochure/cubit/list_brocure_cubit.dart';
import 'package:mhs_mobile/modules/list_brochure/view/fullscreen_brochure_page.dart';
import 'package:mhs_mobile/modules/list_brochure/widgets/card_brochure.dart';
import 'package:mhs_mobile/modules/list_presentation/model/gallery_item_model.dart';
import 'package:mhs_mobile/router/builder.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_card.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ListBrochurePage extends StatelessWidget {
  const ListBrochurePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBrocureCubit()..fetchBrochure(),
      child: const ListBrochureView(),
    );
  }
}

class ListBrochureView extends StatefulWidget {
  const ListBrochureView({super.key});

  @override
  State<ListBrochureView> createState() => _ListBrochureViewState();
}

class _ListBrochureViewState extends State<ListBrochureView> {
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
    return BlocBuilder<ListBrocureCubit, ListBrocureState>(
      builder: (context, st) {
        return OrientationBuilder(
          builder: (context, orientation) {
            debugPrint("orientasi ? $orientation");
            return orientation == Orientation.landscape ? const FullScreenBrochurePage() :  AnnotatedRegion(
              value: SystemUiOverlayStyle.light,
              child: Scaffold(
                backgroundColor: whiteColor,
                appBar: AppBar(
                backgroundColor:primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
                ),
                title: const Text(
                  "Brosur", 
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
                  FullScreenBrochureRoute().go(context);
                }, 
                child: const Icon(
                  Icons.fullscreen,
                  size: 30,
                )
              ),
              body: st.loadingBrocuhure ? const LoadingPage() : st.document.isEmpty ? const EmptyPage(msg: "Tidak ada brosur") :  Stack(
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
}