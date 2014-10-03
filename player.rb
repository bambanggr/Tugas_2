class Player
#Class Variabel
	@@jumlah_player = -1
	@@nama = []
	@@mana = []
	@@darah = []
#getter && setter
	attr_accessor:nama, :mana, :darah
#constructor Class
	def initialize
	end	
#method tambah player baru
	def add_player
		if @@jumlah_player > 1
			puts "ATTENTION : Sudah Mencapai Maksimum Player(3)!!!"
		else
			print "Masukkan Nama Player : "
			STDOUT.flush
			nama_player = gets.chomp
			#Panggil Method is_name_exist
			exist = is_name_exist(nama_player)
			if exist == false
				@@nama = @@nama.push(nama_player)
				@@mana = @@mana.push(40)
				@@darah = @@darah.push(100)
				@@jumlah_player +=1
			else
				puts "\nATTENTION : Nama Player Sudah Ada!!!\n"
			end
		end
	end
#Method menampilkan pemain yang sudah terdaftar
	def current_players
		count_player = 1
		count_player = count_player+@@jumlah_player
		#tampilkan current player
		puts "Current Player : "+count_player.to_s
		#jika belum ada pemain
		if @@jumlah_player < 0
			puts "----------------"
		#jika sudah ada pemain
		else
			puts "Nama, Mana/HP"
			for i in 0..@@jumlah_player
			puts "#{@@nama[i]}, #{@@mana[i]} / #{@@darah[i]} \n"		
			end	
		end
	end
#method cek nama player
	def is_name_exist nama_player
		if @@nama.include?(nama_player)
			return true
		else
			return false
		end
	end
#method input player yang akan battle
	def battle_on
		print "Masukkan Nama Penyerang : "
		STDOUT.flush
		nama_penyerang = gets.chomp

		print "Masukkan Nama Korban : "
		STDOUT.flush
		nama_diserang = gets.chomp

		if is_name_exist(nama_penyerang) == false
			puts "ATTENTION : Nama Pemain Untuk Penyerang Tidak Terdaftar!!!"
		elsif is_name_exist(nama_diserang) == false
			puts "ATTENTION : Nama Pemain Untuk Korban Tidak Terdaftar!!!"
		elsif is_mana_enough(nama_penyerang) == false
			puts "ATTENTION : MP Tidak Cukup!!!"
		elsif is_darah_enough(nama_penyerang) == false
			puts "ATTENTION : Darah Si Penyerang 0, Game Over!!!"		
		elsif is_darah_enough(nama_diserang) == false
			puts "ATTENTION : Darah Si Korban 0, Game Over!!!"
		elsif nama_penyerang == nama_diserang
			puts "ATTENTION : Tidak Bisa Serang Diri Sendiri!!!"
		else
			function_battle(nama_penyerang, nama_diserang)
		end		
	end
#method cek darah player
	def is_darah_enough nama_player
		index_player = @@nama.index(nama_player)
		if @@darah[index_player] > 0
			return true
		else
			return false
		end
	end
#method cek mana player
	def is_mana_enough nama_player
		index_player = @@nama.index(nama_player)
		if @@mana[index_player] >= 20
			return true
		else
			return false
		end
	end
#method fungsi battle
	def function_battle nama_penyerang, nama_diserang
		index_penyerang = @@nama.index(nama_penyerang)
		index_diserang = @@nama.index(nama_diserang)
		puts "#{@@nama[index_penyerang]} melakukan serangan kepada #{@@nama[index_diserang]}\n"
			
		mana_penyerang = @@mana[index_penyerang]-20
		@@mana[index_penyerang] = mana_penyerang

		darah_diserang = @@darah[index_diserang]-20
		@@darah[index_diserang] = darah_diserang

		puts "Description : "	
		puts "#{@@nama[index_penyerang]} :  Mana = #{@@mana[index_penyerang]}, Darah = #{@@darah[index_penyerang]}"
		puts "#{@@nama[index_diserang]} :  Mana = #{@@mana[index_diserang]}, Darah = #{@@darah[index_diserang]}"
	end
end
