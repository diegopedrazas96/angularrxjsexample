# a million commits
for j in {001..21}
do
    Y=$((2017+$(($RANDOM % 1))))
    startm=3
    endm=3
    startd=20
    endd=22
    M=$(($startm+$RANDOM%($endm-$startm+1)))
    #D=$(($RANDOM%31+1))
    D=$(($startd+$RANDOM%($endd-$startd+1)))
    
    bugcnt=$(($RANDOM%15+1))
    echo "$bugcnt"
    #echo "add changes for 1.7.3 on $M/$D/$Y"
    echo "add changes for 1.7.3 on $M/$D/$Y" > commit.md
    tt=$(($RANDOM % 12))
    mm=$(($RANDOM % 60))
    ss=$(($RANDOM % 60))
    export GIT_COMMITTER_DATE="$Y-$M-$D $tt:$mm:$ss"
    echo "$Y-$M-$D $tt:$mm:$ss"
    export GIT_AUTHOR_DATE="$Y-$M-$D $tt:$mm:$ss"
    git add commit.md -f
    git commit --date="$Y-$M-$D $tt:$mm:$ss" -m "add changes for 1.7.3 on $M/$D/$Y"
done
git push origin master --force
git rm -rf 20**
git rm -rf 19**
git rm -rf 18**
git rm -rf 17**
git rm -rf 16**
git rm -rf 15**
git commit -am "cleanup"
git push origin master --force
#echo 2017.2~4