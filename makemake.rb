#!/bio/bin/ruby

puts <<EOS
set -u
################ FOR SNV not indel ##############
preWD=$(pwd)

DIR="/work/HiSeq2000/286/5766_1_WG"
cd $DIR
# reminder for me
# dbsnpOut="genome/mpileup/snv/5766_1_WG.chr__.snv"
# outputDir="genome/mpileup/ven/"
EOS

$cmd = "paste"
$header = ""
$header += "chr\tpos\tref\ttag\tdbSNP"
$cmd += "\\\n <( cat genome/mpileup/snv/5766_1_WG.chr1.snv  | cut -f -5) "

$col = 1
def add_p( c )

  $cmd += "\\\n <( #{c}  | tee  $preWD/log/#{$col} |cut -f 5) "
  $col += 1
end

$header += "1kg"
add_p "perl /grid2/personal-genome/bin/pile/script/vcf21kG.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/1kG 1"

for s in [ "Chinese", "Korean", "NA07022", "NA12878", "NA18507_ILM", "NA19240_SOLiD", "Quake", "Venter", "Watson_CSHL" ] #9
  $header += "\t#{s}"
  add_p "perl /grid2/personal-genome/bin/pile/script/vcf2tgen.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/10Gen/10Gen_#{s}_SNV.gff 1 "
end

for s in [ "HA04554" , "HA04869", "HA04870", "HA04872" ] #4
  $header += "\t#{s}"
  add_p "perl /grid2/personal-genome/bin/pile/script/vcf2j.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/#{s}/target/mpileup/snv 1"
end

$header += "\tesp"
add_p "perl /grid2/personal-genome/bin/pile/script/vcf2esp.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/DB/esp/esp20110913.vcf 1 "


puts "echo  #{$header}"
puts $cmd
