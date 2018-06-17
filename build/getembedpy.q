qhome:hsym`$$[not count u:getenv`QHOME;'"QHOME not defined";u];
\c 23 1000
dl:{[s;url]0N!$[s;;`/:]system"curl -u ",getenv[`GH_APIREAD]," -s -L ",(0N!url),$[s;" -J -O";""]}
download:{
 assets:0N!.j.k[dl[0b]"https://api.github.com/repos/KxSystems/embedPy/releases/",$[not[count x]|x~"latest";"latest";"tags/",x]]`assets;
 0N!relurl:first exec browser_download_url from assets where name like{"*",x,"*"}(`m64`l64`w64!string`osx`linux`windows).z.o;
 $[count relurl;-1"downloading embedpy from ",relurl;'"release not found"];
 dl[1b]relurl;last ` vs hsym`$relurl}
extract:{system 0N!$[x like"*.tgz";"tar -zxf";x like"*.zip";$[.z.o~`w64;"7z x -y";"unzip"];'"not zip or tgz"]," ",string x}
install:{{(` sv qhome,x)1:read1 x}each`p.k`p.q,`${$[x~"w64";x,"/p.dll";x,"/p.so"]}.z.o}
getembedpy:{@[x;y;{exit 1}]}{install extract download x}
