set -u
################ FOR SNV not indel ##############
preWD=$(pwd)

DIR="/work/HiSeq2000/286/5766_1_WG"
cd $DIR
# reminder for me
# dbsnpOut="genome/mpileup/snv/5766_1_WG.chr__.snv"
# outputDir="genome/mpileup/ven/"
echo  chr	pos	ref	tag	dbSNP1kg	Chinese	Korean	NA07022	NA12878	NA18507_ILM	NA19240_SOLiD	Quake	Venter	Watson_CSHL	HA04554	HA04869	HA04870	HA04872	esp
paste\
 <( cat genome/mpileup/snv/5766_1_WG.chr1.snv  | cut -f -5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf21kG.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/1kG 1  | tee  $preWD/log/1 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2tgen.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/10Gen/10Gen_Chinese_SNV.gff 1   | tee  $preWD/log/2 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2tgen.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/10Gen/10Gen_Korean_SNV.gff 1   | tee  $preWD/log/3 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2tgen.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/10Gen/10Gen_NA07022_SNV.gff 1   | tee  $preWD/log/4 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2tgen.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/10Gen/10Gen_NA12878_SNV.gff 1   | tee  $preWD/log/5 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2tgen.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/10Gen/10Gen_NA18507_ILM_SNV.gff 1   | tee  $preWD/log/6 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2tgen.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/10Gen/10Gen_NA19240_SOLiD_SNV.gff 1   | tee  $preWD/log/7 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2tgen.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/10Gen/10Gen_Quake_SNV.gff 1   | tee  $preWD/log/8 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2tgen.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/10Gen/10Gen_Venter_SNV.gff 1   | tee  $preWD/log/9 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2tgen.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/10Gen/10Gen_Watson_CSHL_SNV.gff 1   | tee  $preWD/log/10 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2j.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/HA04554/target/mpileup/snv 1  | tee  $preWD/log/11 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2j.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/HA04869/target/mpileup/snv 1  | tee  $preWD/log/12 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2j.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/HA04870/target/mpileup/snv 1  | tee  $preWD/log/13 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2j.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/data/HA04872/target/mpileup/snv 1  | tee  $preWD/log/14 |cut -f 5) \
 <( perl /grid2/personal-genome/bin/pile/script/vcf2esp.pl genome/mpileup/snv/5766_1_WG.chr1.snv /grid2/personal-genome/DB/esp/esp20110913.vcf 1   | tee  $preWD/log/15 |cut -f 5) 
