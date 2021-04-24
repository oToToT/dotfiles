function prompt_tmp2() {
  if [ "$IN_NTU_CSIE_WORKSTATION" = "true" ]
  then
    if [ "$TMP2_SYNCED" = "true" ]
    then
      p10k segment -s SYNCED -f green -t 'synced'
    else
      p10k segment -s UNSYNCED -f red -t 'unsynced'
    fi
  fi
}
