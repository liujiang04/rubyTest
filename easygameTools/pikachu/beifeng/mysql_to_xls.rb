#  把mysql 里面 所有 数据 备份到svn

require 'mysql2'
require "write_xlsx"

# 是否为本地 数据库
#

class MysqlToXls
end

$isLocal = true

$host = '127.0.0.1'
$port = 3306
$user = 'root'
$passwd = '123456'
$database = 'foreign-project'
if not $isLocal
  $host = '192.168.1.207'
  $passwd = ''
end

$SVNPATH = '/Users/admin/Documents/ljworkspace/local/cocos/assets/pikachu/sanguo/aiweiyou_pokmon/pika_foreign/'

$ccbSql = 'ccbTranslate'
$coffeeSql = 'coffeeTranslate'

def makeExcel(xlsObj, xlsName = 'a_simple.xls')
  workbook = WriteXLSX.new(xlsName)
  xlsObj.each do |row|
    worksheet = workbook.add_worksheet(row[0])
    allArr = row[1]
    for i in 0..allArr.length
      item = allArr[i]
      if item
        len = item.length
        for j in 0..len
          worksheet.write(i, j, item[j])
        end
      end
    end
  end
  workbook.close
end


def beifengXls(client, xls = "", xlsPath = '')
  xlsName = xls
  results = client.query('select * from ' + xlsName)
  #表头
  columns = client.query('show columns from ' + xlsName)
  sheetObj = []
  item = []
  columns.each do |row|
    item.push(row['Field'])
  end
  sheetObj.push(item)
  results.each do |row|
    arr = []
    row.each do |item|
      # puts item
      # puts item[0]
      arr.push(item[1])
    end
    sheetObj.push(arr)
  end
  excelObj = Hash.new()
  excelObj[xlsName] = sheetObj
  makeExcel(excelObj, xlsPath + xlsName + ".xls")
end


if __FILE__ == $0
  client = Mysql2::Client.new(
      :host => $host,
      :username => $user,
      :password => $passwd,
      :database => $database,
      :encoding => 'utf8mb4',
      :port => $port
  )
  puts "生成xls"
  beifengXls(client, $coffeeSql, $SVNPATH)
  beifengXls(client, $ccbSql, $SVNPATH)
  #svn 上传  目前只有我使用  先up一下 如果冲突 再说
  puts "生成成功"
  puts "svn up"
  system 'svn up ' + $SVNPATH
  system 'svn add ' + $SVNPATH + 'ccbTranslate.xls'
  system 'svn add ' + $SVNPATH + 'coffeeTranslate.xls'
  system 'svn status ' + $SVNPATH
  system 'svn commit ' + $SVNPATH + ' -m "update" '
  puts "svn commit success"

  #!!! exec 执行 会阻断代码  system 不会
end




