string.startswith = function(self, str)
    return self:find("^" .. str) ~= nil
end

Admins = {
    ["STEAM_0:1:000000000"] = true, -- Owner
    ["STEAM_0:1:000000000"] = true, -- Admin
}

maintenancemessage = "Server is currently under the maintenance mode! Please try again later"

gameevent.Listen("player_say")
hook.Add(
    "player_say",
    "Maintenance",
    function(data)
        if data.text:startswith("/maintenance") and Admins[Player(data.userid):SteamID()] == nil then
            Player(data.userid):PrintMessage(
                3,
                "[Maintenance System] You dont have enought permissions to use command!"
            )
        elseif data.text == "/maintenance" then
            Player(data.userid):PrintMessage(
                3,
                "[Maintenance System] You have to choose between on or off! (Example: /maintenance on)"
            )
        elseif data.text == "/maintenance on" then
            if maintenance == true then
                Player(data.userid):PrintMessage(
                    3,
                    "[Maintenance System] Maintenance mode is already on! To turn it off run: /maintenance off"
                )
            else
                for i, players in ipairs(player.GetAll()) do
                    players:ChatPrint("[Maintenance System] Server maintenance will begin in 1 minute!")
                    timer.Create(
                        "10 seconds",
                        50,
                        1,
                        function()
                            players:ChatPrint("[Maintenance System] Server maintenance will begin in 10 seconds!")
                        end
                    )
                    timer.Create(
                        "5 seconds",
                        55,
                        1,
                        function()
                            players:ChatPrint("[Maintenance System] Server maintenance will begin in 5 seconds!")
                        end
                    )
                    timer.Create(
                        "4 seconds",
                        56,
                        1,
                        function()
                            players:ChatPrint("[Maintenance System] Server maintenance will begin in 4 seconds!")
                        end
                    )
                    timer.Create(
                        "3 seconds",
                        57,
                        1,
                        function()
                            players:ChatPrint("[Maintenance System] Server maintenance will begin in 3 seconds!")
                        end
                    )
                    timer.Create(
                        "2 seconds",
                        58,
                        1,
                        function()
                            players:ChatPrint("[Maintenance System] Server maintenance will begin in 2 seconds!")
                        end
                    )
                    timer.Create(
                        "1 second",
                        59,
                        1,
                        function()
                            players:ChatPrint("[Maintenance System] Server maintenance will begin in 1 second!")
                        end
                    )
                    timer.Create(
                        "Start",
                        60,
                        1,
                        function()
                            players:ChatPrint("[Maintenance System] Server maintenance is now on!")
                            maintenance = true
                            if Admins[players:SteamID()] == nil then
                                game.KickID(players:UserID(), maintenancemessage)
                            else
                                do
                                end
                            end
                        end
                    )
                end
            end
        elseif data.text == "/maintenance off" then
            if maintenance == false then
                Player(data.userid):PrintMessage(
                    3,
                    "[Maintenance System] Maintenance mode is already off! To turn it on run: /maintenance on"
                )
            else
                maintenance = false
                timer.Remove("10 seconds")
                timer.Remove("5 seconds")
                timer.Remove("4 seconds")
                timer.Remove("3 seconds")
                timer.Remove("2 seconds")
                timer.Remove("1 second")
                timer.Remove("Start")
                for i, players in ipairs(player.GetAll()) do
                    players:ChatPrint("[Maintenance System] Server maintenance is cancelled!")
                end
                Player(data.userid):PrintMessage(3, "[Maintenance System] Maintenance mode is now off!")
            end
        elseif data.text == "/maintenance status" then
            if maintenance == true then
                Player(data.userid):PrintMessage(3, "[Maintenance System] Maintenance mode status: on")
            else
                Player(data.userid):PrintMessage(3, "[Maintenance System] Maintenance mode status: off")
            end
        else
            do
            end
        end
    end
)

gameevent.Listen("player_connect")
hook.Add(
    "player_connect",
    "Connection",
    function(data)
        if maintenance == true and Admins[data.networkid] == nil and data.bot == 0 then
            userid = data.userid
            game.KickID(userid, maintenancemessage)
        else
            do
            end
        end
    end
)

print("[Maintenance System] ----------------------------------------------")
print("[Maintenance System] Successfully Loaded")
print("[Maintenance System]")
print("[Maintenance System] You can contact me on Discord, just be kind - GoodOne#4446.")
print("[Maintenance System] Feel free to request features and report bugs. I will fix them or implement features as fast as I can. :)")
print("[Maintenance System] ----------------------------------------------")
