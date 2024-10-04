import 'dart:developer';
import 'package:diva_tone/core/components/widgets/custom_app_bar.dart';
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:diva_tone/core/utils/app_images.dart';
import 'package:diva_tone/features/profile/presentation/view_model/cubit/get_user_cubit.dart';
import 'package:diva_tone/features/profile/presentation/view_model/model/get_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/constatnts/app_url.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/domain/entities/song.dart';
import '../../../home/presentation/view_model/cubit_news_songs/songs_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: context.isDarkMode? Color(0xff1C1B1B):Color(0xffE5E5E5),
      appBar: CustomAppBar(
        // isHome: true,
        title: Text('Profile' , style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: context.isDarkMode?  Colors.white : Colors.black
                ),),
        backGroundColor: context.isDarkMode? const Color(0xff2C2B2B) : Colors.white ,
      ),
      body: BlocProvider(create: (_)=> GetUserCubit()..getUser(),
      
      child: const ProfileViewBody(),)
    ));
  }
}


class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCubit,GetUserState>(
      builder: (context , state) {
        if(state is GetUserLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        else if (state is GetUserSuccess) {
          return ProfileViewBodyItem(userModelEntity: state.userEntity);
        }
        else {
          return const Center(child: Text('Error Loading Profile'));
        }
      }
      );
  }
}
class ProfileViewBodyItem extends StatelessWidget {
  const ProfileViewBodyItem({super.key, required this.userModelEntity});
  final UserModelEntity userModelEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserProfileDetail(userModelEntity: userModelEntity,),
          Padding(
            padding: const EdgeInsets.only(left :20.0 , top: 20),
            child: Text('FAVORITE SONGS' , style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: context.isDarkMode?  Colors.white : Colors.black
                    ),),
          ),
                  const PublicPlayList()
      
        ],
      ),
    );
  }
}

class UserProfileDetail extends StatelessWidget {
  const UserProfileDetail({super.key, required this.userModelEntity});
  final UserModelEntity userModelEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height/3.3,
      decoration: BoxDecoration(
        
        color: context.isDarkMode ? const Color(0xff2C2B2B) : Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)
        ),
        
      ),
      child: Column(
        
        children: [
          CircleAvatar(
            radius: 50,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image:  NetworkImage(userModelEntity.imageUrl, )),
                shape: BoxShape.circle
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(userModelEntity.email, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: context.isDarkMode?  const Color.fromARGB(255, 103, 102, 102) : AppColors.darkGrey
                )),
          const SizedBox(height: 10),
          Text(userModelEntity.name, style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: context.isDarkMode?  Colors.white : Colors.black
                )), 

        ],
      ),
    );
  }
}

class PublicPlayList extends StatelessWidget {
  const PublicPlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> SongsCubit()..getPlayList(),
      child:const  Padding(
        padding: EdgeInsets.all(20.0),
        child: PublicPlayListBody(),
      ),
      );
  }
}

class PublicPlayListBody extends StatelessWidget {
  const PublicPlayListBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongsCubit,SongsState>(
      builder: (context , state) {
        if(state is SongsPlayListLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if(state is SongsPlayListSuccess) {

          if(state.favSongs.length == 0) {
          log(state.favSongs.length.toString());
            return Center(child: Opacity(
              opacity: .6,
              child: Container(
                height: 300,
                width: 500,
                
                decoration: BoxDecoration(
                  // color: Colors.black,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImages.noItem))
                ),
              ),
            ),);
          }
          else
          return PublicPlayListItem(songs :state.favSongs);
        }
        else{
          log("Loaded Failed public play list");
          return const Text("Wrong");
        }
      }
      
      );
  }
}
class PublicPlayListItem extends StatelessWidget {
  const PublicPlayListItem({super.key,required this.songs});
  final List<SongEntity> songs;

  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: songs.length,
      itemBuilder: (context, index) {
    
        return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(image: NetworkImage(
                  '${AppUrls.fireStorage}${songs[index].artist}, ${songs[index].title}.jpeg${AppUrls.mediaAlt}'
                )),
                color: context.isDarkMode ? AppColors.darkGrey : const Color(0xffE6E6E6),
              ),
              
            ),
            const SizedBox(width: 20), 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    songs[index].title == 'ya_nas_kwlwly'
                        ? 'Ya Nas Kwlwly'
                        : songs[index].title == 'Sheel_Oyunak_Any'
                            ? 'Sheel Oyunak Any'
                            : songs[index].title == 'mn_mslsl_alatawlah'
                                ? 'AlAtawla'
                                : 'Yama Lyaly',
                    style: TextStyle(
                      color: context.isDarkMode? Colors.white: Colors.black,
                      fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    songs[index].artist == 'nancy_agram'
                        ? 'Nancy Agram'
                        : songs[index].artist == 'sara_hytham'
                            ? 'Sara Haytham'
                            : 'Hasan Shakosh',
                    style: TextStyle(
                      color: context.isDarkMode? Colors.grey: AppColors.darkGrey,
                      fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                  
                ],
              ),
          
            ),
            Text(songs[index].duration.toString().replaceAll('.', ':') , style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14
            ),),
            const SizedBox(width: 24,),
            // FavoriteButton(songEntity:songs[index])
            ],
        ),
      );
      },
    );
  }
}