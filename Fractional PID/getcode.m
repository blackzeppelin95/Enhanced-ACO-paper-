function f=getcode(chrom,lo,hi,bits)
[M,N]=size(chrom);
npar=N/bits;
quant=(0.5.^[1:bits]');
%quant=quant/sum(quant);
%normalized
ct=chrom;% each column contains
par=((ct*quant)*(hi-lo)+lo); % DA conversion and
% unnormalize varaibles  % reassemble population
f=reshape(par,M,npar);