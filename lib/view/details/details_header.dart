part of'details_view.dart';


class HeaderSection extends StatelessWidget {
  
  final UserModel userModel;
  final List<StandupModel> standups;

  const HeaderSection({
    super.key, 
    required this.userModel, 
    required this.standups
  });

  @override
  Widget build(BuildContext context) {
    StandupModel? selectedStandUp;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(userModel.profileImg, scale:1,),
            const SizedBox(width: 8,),
            Text(userModel.username),
          ],
        ),
        const SizedBox(width: 16,),
        SizedBox(
          width: 300,
          child: StatefulBuilder(
            builder: (context,setLocalState) {
              return DropdownButton<StandupModel>(
                value: selectedStandUp,
                onChanged: (value){
                  selectedStandUp = value;
                  BlocProvider.of<DetailsBloc>(context).add(FetchDetaisEvent(userModel.id, value!.id));
                  setLocalState(() {},);
                },
                items: [
                  ...List.generate(
                    standups.length, 
                    (index) {
                      final standupLoop = standups[index];
                      return DropdownMenuItem(
                        value: standupLoop,
                        child: Text(standupLoop.name)
                      );
                    }     
                  )
                ],
              );
            }
          ),
        )

      ],
    );
  }
}