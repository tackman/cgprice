coffee genlist.coffee > ../mylibs/idol_list.coffee
coffee genids.coffee > ../mylibs/idol_ids.coffee
coffee genpartof.coffee > ../mylibs/idol_partof.coffee
cp pre_table.coffee  ../mylibs/idol_table.coffee

git add ../mylibs/idol_list.coffee
git add ../mylibs/idol_ids.coffee
git add ../mylibs/idol_partof.coffee
git add ../mylibs/idol_table.coffee
echo "git diffを表示します"
git diff
