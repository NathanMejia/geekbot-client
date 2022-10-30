part of 'home_view.dart';

class ContentSection extends StatelessWidget {
  const ContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final users = BlocProvider.of<HomeBloc>(context).currentsUserModel;
        final standUps = BlocProvider.of<HomeBloc>(context).currentsStandUpModel;
        final apiKey = BlocProvider.of<HomeBloc>(context).currentApiKey;
        if(state is LoadingHomeState){
          return const Expanded(child:Center(child: CircularProgressIndicator(),));
        }
        return Expanded(
            child: ListView.separated(
          itemCount: users.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final userLoop = users[index];
            return ListTile(
              leading: Image.network(userLoop.profileImg),
              title: Text(userLoop.username),
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) 
                      => DetailsView(
                        userModel: userLoop, 
                        standupModel: standUps, 
                        apiKey: apiKey!,),
                  )
                );
              },
            );
          })
        );
      },
    );
  }
}
