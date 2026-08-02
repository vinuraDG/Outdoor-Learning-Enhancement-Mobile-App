import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// Wraps the YouTube embed in a local HTML page (served with a proper
/// https://www.youtube.com base-URL) so the iframe has a valid HTTP origin.
/// Loading the embed URL directly as a top-level page causes error 153 because
/// YouTube requires the player to be inside an iframe with a known referrer.
class YoutubePlayerView extends StatefulWidget {
  final String videoId;
  final Color accentColor;

  const YoutubePlayerView({
    super.key,
    required this.videoId,
    this.accentColor = Colors.red,
  });

  @override
  State<YoutubePlayerView> createState() => _YoutubePlayerViewState();
}

class _YoutubePlayerViewState extends State<YoutubePlayerView> {
  bool _loading = true;

  String get _html => '''
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
<style>
*{margin:0;padding:0;box-sizing:border-box;}
html,body{background:#000;width:100%;height:100%;overflow:hidden;}
#player{position:fixed;top:0;left:0;width:100%;height:100%;}
</style>
</head>
<body>
<div id="player"></div>
<script>
var tag=document.createElement('script');
tag.src='https://www.youtube.com/iframe_api';
document.head.appendChild(tag);
var player;
function onYouTubeIframeAPIReady(){
  player=new YT.Player('player',{
    videoId:'${widget.videoId}',
    playerVars:{autoplay:1,controls:0,rel:0,modestbranding:1,playsinline:1,
                origin:'https://www.youtube.com'},
    events:{
      onReady:function(e){
        e.target.playVideo();
        try{window.flutter_inappwebview.callHandler('videoState',true);}catch(_){}
      },
      onStateChange:function(e){
        try{window.flutter_inappwebview.callHandler('videoState',e.data===1);}catch(_){}
      }
    }
  });
}
</script>
</body>
</html>
''';

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          InAppWebView(
            initialData: InAppWebViewInitialData(
              data: _html,
              mimeType: 'text/html',
              encoding: 'utf-8',
              baseUrl: WebUri('https://www.youtube.com'),
            ),
            initialSettings: InAppWebViewSettings(
              javaScriptEnabled: true,
              mediaPlaybackRequiresUserGesture: false,
              allowsInlineMediaPlayback: true,
              useHybridComposition: true,
              transparentBackground: true,
              userAgent:
                  'Mozilla/5.0 (Linux; Android 10; K) '
                  'AppleWebKit/537.36 (KHTML, like Gecko) '
                  'Chrome/124.0.0.0 Mobile Safari/537.36',
            ),
            onWebViewCreated: (controller) {
              controller.addJavaScriptHandler(
                handlerName: 'videoState',
                callback: (_) {
                  if (mounted && _loading) setState(() => _loading = false);
                },
              );
            },
            onReceivedError: (controller, request, error) {
              if (mounted) setState(() => _loading = false);
            },
          ),
          if (_loading)
            Container(
              color: Colors.black,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: widget.accentColor),
                    const SizedBox(height: 12),
                    const Text('Loading video…',
                        style: TextStyle(
                            color: Colors.white70, fontSize: 13)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
