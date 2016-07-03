
require "date"

class Calender

    @dataObject

    def initialize( dataObject )

      if dataObject then
          @dataObject = dataObject
      else
          print "日付が設定されていません"
          exit
      end

    end

    #htmlの作成
    def makeHtml

      totalHtml=""
      #ヘッダー
      tableHeader  =  makeTableHeader
      #ボディー部分の作成
      tableBody    =  makeTableBody

      totalHtml = tableHeader.to_s + tableBody.to_s
p totalHtml
    end

    #tableヘッダーの作成
    def makeTableHeader
        headerHtml=<<"EOF"
        <table border="1" cellpadding="1" cellspacing="1" >
          <thead>
            <tr>
                <th >-</th>
                <th>山本</th>
                <th>松本</th>
                <th>西本</th>
                <th>来客・その他</th>
            </tr>
        </thead>

EOF
       return headerHtml
    end

    #テーブルボディ部分の作成
    def makeTableBody

        tableBody =""

        targetYear  = @dataObject.year
        targetMonth = @dataObject.month

        lastDay = Date.new( targetYear, targetMonth, -1).day

        for day in 1..lastDay
          weekNum = Date.new( targetYear, targetMonth, day).wday
          tableBody += makeDayHtml( day, weekNum )
        end

        return tableBody
    end

    #1行1行の作成
    def makeDayHtml( day , weekNum)

        atachedCssDay = atachedWeekColor( day, weekNum )

        bodyHtml=<<"EOF"
        <tr>
        <th>#{atachedCssDay}</th>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
EOF
        return bodyHtml.to_s
    end

    def atachedWeekColor( day, weekNum )

        atachedCssDay=""

        case weekNum
        #日曜
        when 0 then
            atachedCssDay = '<span style="color: rgb(255, 0, 0);">' + day.to_s + '</span>'
        #土曜日
        when 6 then
            atachedCssDay = '<span style="color: rgb(0, 0, 255);">' + day.to_s  + '</span>'
        else
            atachedCssDay = day.to_s
        end

        return atachedCssDay
    end

end

dataObject = Time.now
calender = Calender.new( dataObject )
calender.makeHtml
p calender
#calender.printHelllo("hogehoge","norio")
