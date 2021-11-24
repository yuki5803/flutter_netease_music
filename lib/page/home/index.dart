import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/component/bottomSheet/index.dart';
import 'package:flutter_demo/component/tag/index.dart';
import 'package:flutter_demo/config/storage_manage.dart';
import 'package:flutter_demo/model/recommond.dart';
import 'package:flutter_demo/page/home/homeDrawer/index.dart';
import 'package:flutter_demo/page/me/index.dart';
import 'package:flutter_demo/page/musician/index.dart';
import 'package:flutter_demo/page/recommond/index.dart';
import 'package:flutter_demo/route/router.dart';
import 'package:flutter_demo/utils/index.dart';
import 'package:flutter_demo/view_model/audioPlayer_model.dart';
import 'package:flutter_demo/view_model/common_model.dart';
import 'package:provider/provider.dart';

final List<Widget> pages = <Widget>[RecommondPage(), MusicianPage(), MePage()];

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  static PageController pageController = PageController();
  static int currentIndex = 0;

  var token = StorageManage.getString(key: 'token');
  var userId = StorageManage.getString(key: 'uid');
  var roleId = StorageManage.getString(key: "rid");
  Playing playing;

  List<MusicPlayList> musicPlayList;
  List<Audio> playList = [
    Audio.network(
      "https://www.ytmp3.cn/down/75509.mp3",
      metas: Metas(
        title: "反方向的钟",
        artist: "周杰伦",
        album: "CountryAlbum",
      ),
    ),
    Audio.network(
      "https://www.ytmp3.cn/down/35982.mp3",
      metas: Metas(
        title: "Uptown Funk",
        artist: "Mark Ronson",
        album: "CountryAlbum",
      ),
    )
  ];
  // = [
  //   MusicPlayList(
  //       title: '反方向的钟',
  //       tag: Tag(
  //         content: 'SQ',
  //         color: (Colors.red),
  //       ),
  //       musician: '周杰伦'),
  //   MusicPlayList(
  //       title: '青花瓷',
  //       tag: Tag(
  //         content: 'HQ',
  //         color: (Colors.green),
  //       ),
  //       musician: '周杰伦'),
  //   MusicPlayList(
  //       title: '告白气球',
  //       tag: Tag(
  //         content: 'SQ',
  //         color: (Colors.red),
  //       ),
  //       musician: '周杰伦'),
  //   MusicPlayList(
  //       title: '菊花台',
  //       tag: Tag(
  //         content: 'SQ',
  //         color: (Colors.red),
  //       ),
  //       musician: '周杰伦'),
  // ];
  @override
  bool get wantKeepAlive => true;

  @override
  initState() {
    if (token == null || userId == null || roleId == null) {
      Future.delayed(Duration.zero, () {
        Navigator.pushNamed(context, RouteName.login);
      });
    }
    // playing = assetsAudioPlayer.current.value;
    musicPlayList = playList
        .map((audio) => MusicPlayList(
            title: audio.metas.title,
            tag: Tag(
              content: 'SQ',
              color: (Colors.red),
            ),
            musician: audio.metas.artist))
        .toList();

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  final List<BottomBarRender> bottomBarRender = [
    BottomBarRender(
        title: '发现',
        icon: Icon(
          Icons.alternate_email,
          size: sp(22),
        ),
        activedIcon: Icon(
          Icons.alternate_email,
          color: Colors.red,
          size: sp(22),
        )),
    BottomBarRender(
        title: '播客',
        icon: Icon(
          Icons.playlist_play,
          size: sp(22),
        ),
        activedIcon: Icon(
          Icons.playlist_play,
          color: Colors.red,
          size: sp(22),
        )),
    BottomBarRender(
      title: '我的',
      icon: Icon(
        Icons.recent_actors,
        size: sp(22),
      ),
      activedIcon: Icon(
        Icons.recent_actors,
        color: Colors.red,
        size: sp(22),
      ),
    ),
    BottomBarRender(
        title: 'K歌',
        icon: Icon(
          Icons.mic,
          size: sp(22),
        ),
        activedIcon: Icon(
          Icons.mic,
          color: Colors.red,
          size: sp(22),
        )),
    BottomBarRender(
      title: '云村',
      icon: Icon(
        Icons.record_voice_over,
        size: sp(22),
      ),
      activedIcon: Icon(
        Icons.record_voice_over,
        color: Colors.red,
        size: sp(22),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<CommonModel>(context);
    var audioModel = Provider.of<AudioPlayerModel>(context);
    model.initLoginStatus();
    return Scaffold(
      drawer: Drawer(
        child: HomeDrawer(),
      ),
      extendBody: true,
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: rw(7), horizontal: rw(14)),
            color: Color(0xCCffffff),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'Assets/musician-1.jpg',
                            width: rw(49),
                            height: rw(45),
                            fit: BoxFit.cover,
                          )),
                      Container(
                          margin: EdgeInsets.fromLTRB(rw(11), 0, 0, 0),
                          child: Text(audioModel.currentPlayingAudio))
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () async {
                            try {
                              await audioModel.audioPlayOrPause();
                            } catch (e) {
                              print('播放错误！' + e);
                              BotToast.showText(text: '音乐播放失败!请检查音乐链接是否有效!');
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 0, rw(18), 0),
                            padding: EdgeInsets.all(rw(7)),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Color(0x64a6a6a6)),
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              audioModel.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: rw(24),
                            ),
                          )),
                      InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return MyBottomSheet(
                                    musicPlayList: musicPlayList,
                                    onClick: (item, int index) {
                                      audioModel.audioPlayAtIndex(index);
                                    },
                                    activeTitle: audioModel.currentPlayingAudio,
                                  );
                                });
                          },
                          child: Icon(
                            Icons.queue_music,
                            size: rw(35),
                          )),
                    ],
                  )
                ])),
        BottomNavigationBar(
          onTap: (index) {
            pageController.jumpToPage(index);
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: bottomBarRender
              .map((renderModel) => BottomNavigationBarItem(
                    icon: renderModel.icon,
                    activeIcon: renderModel.activedIcon,
                    label: renderModel.title,
                  ))
              .toList(),
        )
      ]),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                  color: Colors.white,
                  child: Icon(
                    Icons.subject_outlined,
                    color: Color(0xff505050),
                  ))),
        ),
        titleSpacing: 0,
        title: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteName.search);
            },
            child: Offstage(
                offstage: currentIndex != 0,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: rw(3)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0x64e5e5e5)),
                        width: rw(247),
                        child: Row(
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: rw(5)),
                                child: Icon(
                                  Icons.search,
                                  color: Color(0x64999999),
                                )),
                            Text(
                              '此间少年',
                              style: TextStyle(
                                  color: Color(0x64999999), fontSize: sp(14)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ))),
        actions: [
          Offstage(
              offstage: currentIndex != 0,
              child: Container(
                padding: EdgeInsets.only(right: rw(20)),
                child: Icon(
                  Icons.mic,
                  color: Color(0xff505050),
                ),
              ))
        ],
      ),
      body: PageView.builder(
        itemBuilder: (ctx, index) => pages[index],
        itemCount: pages.length,
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
