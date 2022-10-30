part of 'home_view.dart';


class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    GlobalKey<FormState> key = GlobalKey<FormState>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 300,
                  child: Form(
                    key: key,
                    child: TextFormField(
                      controller: controller,
                      decoration: const InputDecoration(hintText: "Ingrese Key"),
                      validator: (value) {
                        
                        if (value == null || value.isEmpty){
                          return "empty";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    final result = key.currentState?.validate();
                    if(result == true){
                      BlocProvider.of<HomeBloc>(context).add(InitHomeEvent(controller.text));
                    }
                  }, 
                  child: const Text("Conectar")
                ),
              ],
            ),

            const Text("Team ID: 1231414123"),
            const Text("Team Name : Un nombre mamalon")
          ],
        )
      ],
    );
  }
}