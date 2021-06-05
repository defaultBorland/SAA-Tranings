# SAA-Tranings
Main Scripts Branch without DB for trainings with arsenal generation.

### DEDICATED SERVER ONLY

How to make things works:
- Just place all the files within mission.sqm file in mission directory.

How to assign predefined Zeuses (Other Zeuses can be assigned on the fly by corresponding module in SAA-Main):
- In file `initZeus.sqf` add desired SteamID64 strings to array:

        _zeuses = [
           "76561198042919168", 
           "76561198066438612"
        ];

How to import server settings from `ServerSettings.txt` to your server:
 - Copy whole content from `ServerSettings.txt`;
 - Launch Arma 3 Server and join;
 - Log in as Admin (Dedicated);
 - In addon options menu on SERVER tab press import;
 - Done;

Which files you can exclude from mission folder while hosting your own mission:
 - .gitattributes
 - LICENSE
 - mission.sqm (If you have your own)
 - README.md
 - ServerSettings.txt
  
To be continued (maybe) ...
