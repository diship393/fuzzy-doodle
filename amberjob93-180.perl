#!/usr/bin/perl -w
use Cwd;
$wd=cwd;

print "Preparing meta file\n";
$name="mexb";
$incr=3;
$name1="Amber93-180.out";
$incr1=3;
$incr2=1;

&prepare_input();

exit(0);

sub prepare_input() {

    $dihed=93;
    while ($dihed < 183 ) {
          $dis=0;
        while ($dis<1){
#       if ($)
      print "Processing dihedral: $dihed\n";
      &write_meta();
      $dis +=$incr1;
      $dis1 +=$incr1
}
     $dihed += $incr;
     $dihed1 = $dihed -3;
    }
}

sub write_meta {
    open METAFILE,'>>', "$name1";
    print METAFILE <<EOF;
export CUDA_VISIBLE_DEVICES=1
nohup \$AMBERHOME/bin/pmemd.cuda -O -i mdin_min.$dihed -p ${name}.prmtop -c  ${name}_prod_${dihed1}.rst -r ${name}_min_${dihed}.rst  -o ${name}_min_${dihed}.out 
wait
nohup \$AMBERHOME/bin/pmemd.cuda -O -i mdin_equi.$dihed -p ${name}.prmtop -c ${name}_min_${dihed}.rst  -r ${name}_equil_${dihed}.rst -o ${name}_equil_${dihed}.out 
wait
nohup \$AMBERHOME/bin/pmemd.cuda -O -i mdin_prod.$dihed -p ${name}.prmtop -c ${name}_equil_${dihed}.rst -r ${name}_prod_${dihed}.rst -o ${name}_prod_${dihed}.out -x ${name}_prod_${dihed}.nc
wait

EOF
    close MDINFILE;
}
