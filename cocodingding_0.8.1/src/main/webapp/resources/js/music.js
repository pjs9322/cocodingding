            var how_many_ads = 3;
            var now = new Date()
            var sec = now.getSeconds()
            var ad = sec % how_many_ads;
            ad += 1;
    
            if (ad == 1) {
                banner = "/qboard/resources/music/music1.mp3";
            } else if (ad == 2) {
                banner = "/qboard/resources/music/music2.mp3";
            } else if (ad == 3) {
                banner = "/qboard/resources/music/music3.mp3";
            }
    
            document.write('<embed src="' + banner + '" loop="100" hidden="true">');