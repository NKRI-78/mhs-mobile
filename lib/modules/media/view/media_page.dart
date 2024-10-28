import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/helper.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/media/cubit/media_cubit.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/image_circle.dart';
import 'package:mhs_mobile/widgets/pages/page_empty.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MediaCubit()..fetchMedia(),
      child: const MediaView()
    );
  }
}

class MediaView extends StatelessWidget {
  const MediaView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaCubit, MediaState>(
      buildWhen: (previous, current) => previous.loadingMedia != current.loadingMedia,
      builder: (context, st) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: CustomScrollView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            slivers: [
              const HeaderSection(
                title: "Media", 
                isCircle: true,
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: st.media.isEmpty ? 0 : 80, horizontal: st.media.isEmpty ? 0 : 100),
                sliver: st.loadingMedia ? const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator.adaptive()),
                ) : st.media.isEmpty ? const SliverFillRemaining(
                  child: Center(child: EmptyPage(msg: "Tidak ada media"))) :  SliverGrid.builder(
                  itemCount: st.media.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 80,
                    crossAxisSpacing: 50.0,
                    childAspectRatio: 2.0
                  ), 
                  itemBuilder: (context, index) {
                    final data = st.media[index];
                    if(st.media.isEmpty)
                    {
                      debugPrint("Kepanggil ?");
                      const EmptyPage(msg: "Media kosong");
                    }
                    return st.loadingMedia ? const LoadingPage() : 
                    InkWell(
                      onTap: () {
                        Helper.openLink(url: data.linkUrl ?? "-", context: context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Stack(
                          fit: StackFit.loose,
                          clipBehavior: Clip.none,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(data.name ?? "",
                                maxLines: 2,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: whiteColor,
                                  fontSize: fontSizeDefault,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Positioned(
                              right: 50,
                              left: 50,
                              top: -50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: AspectRatio(
                                      aspectRatio: 1/1, child: ImageCircle(
                                      image: data.imgUrl ?? "", 
                                      radius: 45,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ]
          ),
        );
      }
    );
  }
}