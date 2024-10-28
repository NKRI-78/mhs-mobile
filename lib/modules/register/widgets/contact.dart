import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhs_mobile/misc/theme.dart';
import 'package:mhs_mobile/modules/register/cubit/register_cubit.dart';
import 'package:mhs_mobile/widgets/extension/snackbar.dart';
import 'package:mhs_mobile/widgets/header/header_section.dart';
import 'package:mhs_mobile/widgets/images/placeholders.dart';
import 'package:mhs_mobile/widgets/pages/pages_loading.dart';
import 'package:shimmer/shimmer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit()..fetchContacts(), child: const ContactPageView());
  }
}

class ContactPageView extends StatelessWidget {
  const ContactPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, st) {
        return Scaffold(
          body: CustomScrollView(
            shrinkWrap: true,
           physics: const AlwaysScrollableScrollPhysics(),
           slivers: [
              const HeaderSection(
                title: "Pilih Kontak", 
                isCircle: true,
                isPrimary: false,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  st.loading ? const LoadingPage() : ListView(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: st.contact?.map((e) => ListTile(
                    title: Text(e.displayName),
                    subtitle: Text(e.phones.isNotEmpty
                    ? e.phones.first.number
                    : 'No phone number' ),
                    leading: e.photo == null ? const CircleAvatar(
                      radius: 20,
                      child: Icon(Icons.person),
                    ) : CircleAvatar(
                      backgroundImage: MemoryImage(e.photoOrThumbnail!),
                      radius: 20,
                    ),
                    onTap: () async {
                      if (e.phones.isNotEmpty) {
                        // RegisterCubit.phoneController.text = e.phones.first.number.replaceAll(RegExp(r'^([^,.]*[.,])|\D+'), "").replaceAll("62", "0");
                      } else {
                        ShowSnackbar.snackbar(context, 'Contact has no phone number', '', errorColor);
                      }
                      Navigator.pop(context);
                    })).toList() ?? [],
                  ),
              ]))
           ],
          )
        );
      }
    );
  }
}