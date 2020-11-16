# Global variables for program
$pass_comp_count = 0
$pass_attempt_count = 0
$pass_yards_count = 0

def game_info
    puts "Booting up QB STAT-TRACKER 2000! The most advanced QB stat tracker on the planet!"
    puts "<>--<>--<>--<>"
    puts "Who is starting at QB today?"
    $qb_name = gets.chomp
    puts "Thank you. Today, " + $qb_name + " is starting the game."
    puts "<>--<>--<>--<>"
    puts "<>--<>--<>--<>"
end

def play_call
    puts "NEXT PLAY: Was this a PASS play or a RUN play?"
    puts "If you'd like to review the stats for " + $qb_name.to_s + ", please type 'REVIEW STATS'."
    play_type = gets.chomp
    if play_type == "RUN"
        puts "No QB stats are affected."
        puts "<>--<>--<>--<>"
        play_call
    end
    if play_type == "PASS"
        puts "Was the pass completed?"
        play_result = gets.chomp
        if play_result == "YES"
            $pass_comp_count += 1
            $pass_attempt_count += 1
            puts "<>--<>--<>--<>"
            play_call
        elsif play_result == "NO"
            $pass_attempt_count += 1
            puts "<>--<>--<>--<>"
            play_call
        end
    end
    if play_type == "REVIEW STATS"
        puts "<>--<>--<>--<>"
        puts "Comp: " + $pass_comp_count.to_s
        puts "Attempt: " + $pass_attempt_count.to_s
        puts "<>--<>--<>--<>"
        play_call
    else
        puts "Try that command again"
        play_call
    end
end

# -- PROGRAM ORDER --
game_info
play_call