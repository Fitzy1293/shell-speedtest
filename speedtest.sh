#!/bin/dash

set -eu

RUNS="1000" 

shell_speedtest () {
    test_shell="$1"
    script_base_fname="bibtextcreator"
    script_fname="${script_base_fname}-${1}.sh" # i.e bibtextcreator-bash.sh or bibtextcreator-dash.sh
    script_shebang="$(head -n 1 ${script_fname})"
    
    printf "shell: ${test_shell}\t${script_fname}\t${script_shebang}\t"
    
    # Run script x amount of times in loop.
    start_time="$(date -u +%s%N)"
    for i in $(seq 1 ${RUNS}); do  "./${script_fname}" testarticle.pdf; done
    end_time="$(date -u +%s%N)"
    
    time_delta_nanoseconds="$(expr ${end_time} - ${start_time})"
    time_delta_seconds="$(echo "${time_delta_nanoseconds} / (10^9)" | bc -l)"

    printf "%.3f seconds\t" ${time_delta_seconds}
    printf "(${time_delta_nanoseconds} nanoseconds)\n"
}

echo "testing shells with ${RUNS} runs"
shell_speedtest dash
shell_speedtest bash