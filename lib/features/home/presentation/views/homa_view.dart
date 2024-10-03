import 'package:diva_tone/core/utils/app_images.dart';
import 'package:diva_tone/features/home/presentation/views/widgets/news_songs.dart';
import 'package:diva_tone/features/onboarding/presentation/view/widgets/custom_logo.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_tab_bar.dart';
import 'widgets/play_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin{
    late TabController tabController ;
    @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: const CustomLogo(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 170,
              child: Stack(children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(AppImages.frame1, fit: BoxFit.cover,)),
                Align(
                  alignment: Alignment.topRight,
                  
                  child: Padding(
                    padding: const EdgeInsets.only(right :40 ),
                    child: Image.asset(AppImages.frame2,fit: BoxFit.cover ),
                  )),
              ]),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 40),
                child: CustomTabBar(tabController: tabController,),
              ),
              SizedBox(
                height: 260,
                child: TabBarView(
                  controller: tabController,
                  children: [
                  const NewsSongs(),
                  Container(),
                  Container(),
                  Container(),
                ]),
              ),
              const PlayList()
          ],
        ),
      ),
    ));
  }
}

