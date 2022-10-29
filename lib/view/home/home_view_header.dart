part of 'home_view.dart';


class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: "Ingrese Key"),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){}, 
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