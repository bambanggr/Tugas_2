require_relative 'player'
class Main_Menu
	pilihan = 0
	while(pilihan != "3")
		puts "\n"
		puts ".:: Welcome To Battle Arena ::.\n"
		puts "Ket : Ketik Nomor Untuk Memilih Menu \n"
		puts "1. Input Nama Player\n"
		puts "2. Battle ON!\n"
		puts "3. Keluar"
		puts "=================================\n"
		instance_player = Player.new
		instance_player.current_players
		puts "\n"
		print "Pilih Menu : "
		STDOUT.flush
		pilihan = gets.chomp
		puts "\n"
	
		#Menu Pilihan
		if pilihan == "1"
			instance_player.add_player
		elsif pilihan == "2"
			instance_player.battle_on
		elsif pilihan == "3"
			puts "Sampai Jumpa ^_^"
		else
			puts "ATTENTION : Menu Hanya 1-3!!!"
		end
	end
end
