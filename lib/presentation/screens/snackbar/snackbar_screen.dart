import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: Text('Hola Mundo'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text('estas seguro'),
              content: Text('Estas seguro que quieres eliminar este archivo'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(), child: Text('Cancelar')),
                FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Aceptar')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Snackbars y Dialogos'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.tonal(
                  onPressed: () {
                    showAboutDialog(context: context, children: [
                      const Text(
                          'Sunt cupidatat laborum exercitation occaecat qui quis duis reprehenderit exercitation sit occaecat exercitation do cillum. Sint mollit duis anim est reprehenderit laboris proident quis in ad. Dolor minim Lorem anim dolore laboris eiusmod cupidatat commodo voluptate esse ex irure. Anim magna laborum amet elit officia anim Lorem eiusmod sunt incididunt veniam nostrud culpa id. Ut cupidatat tempor mollit laboris tempor aliquip. Quis et ad exercitation elit ad labore ex ea ipsum ex occaecat aute occaecat pariatur. Occaecat non incididunt id reprehenderit esse eiusmod culpa elit irure laborum.')
                    ]);
                  },
                  child: const Text('Licencias Usadas')),
              FilledButton.tonal(
                  onPressed: () => openDialog(context),
                  child: const Text('Mostrar Dialogo'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Mostar Snackbars'),
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: () => showCustomSnackbar(context),
        ));
  }
}
