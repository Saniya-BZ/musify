import 'package:musify/models/playlist.dart';
import 'package:provider/provider.dart';
import 'song_page.dart';
import '../models/song.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final dynamic playlistProvider;

  @override
  void initState(){
    super.initState();
    playlistProvider = Provider.of<PlayListProvider>(context, listen: false);

  }
  void goToSong(int songIndex){
    playlistProvider.currentSongIndex= songIndex;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SongsPage()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title:const Text("P L A Y L I S T") ,),
      drawer: const Drawer(),
      body: Consumer<PlayListProvider>(
          builder:(context, value, child) {

            final List<Song> playlist = value.playlist;

            return ListView.builder(
                itemCount: playlist.length,
                itemBuilder: (context,index){

                  final Song song = playlist[index];
                  return ListTile(
                    title: Text(song.songName),
                    subtitle: Text(song.artistName),
                    leading: Image.asset(song.albumArtImagePath),
                    onTap: (){
                      goToSong(index);
                    },
                  );
                }
            );
          }
      ),
    );
  }

}