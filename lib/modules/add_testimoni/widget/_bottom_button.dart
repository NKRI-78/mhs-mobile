part of '../view/add_testimoni.dart';

// ignore: unused_element
class _BottomButon extends StatelessWidget {
  const _BottomButon();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTestimoniCubit, AddTestimoniState>(builder: (context, state) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        height: 47,
        child: ElevatedButton(
          onPressed: state.loading
              ? null
              : () {
                  if (_formTestimoni.currentState?.validate() ?? false) {
                    context.read<AddTestimoniCubit>().sumbitTestimoni(context);
                  }
                  if(context.mounted){
                    FocusScope.of(context).unfocus();
                  }
                },
          child: state.loading
              ? const CircularProgressIndicator.adaptive()
              : const Text(
                  'KIRIM',
                ),
        ),
      );
    });
  }
}