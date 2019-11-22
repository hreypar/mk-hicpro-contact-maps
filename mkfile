et  DESCRIPTION:
# mk module to run HiC-Pro pipeline up to contact maps
#
# USAGE:
# Single target execution: `mk <TARGET>` where TARGET is
# any line printed by the script `bin/mk-targets`
#
# Multiple target execution in tandem `bin/mk-targets | xargs mk`
#
# AUTHOR: HRG
#
# Run HiC-Pro scripts that build and normalise matrices.
#
results/%:	data/%
	mkdir -p `dirname $target`
	HiC-Pro \
		--input $prereq \
		--output $target \
		--conf config.hicpro \
		--step merge_persample \
		--step build_contact_maps \
		--step ice_norm

