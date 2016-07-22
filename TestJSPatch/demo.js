
defineClass("ViewController", {
            
            //instance method definitions
            tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
            var row = indexPath.row()
            if (self.dataSource().count() > row) {  // 加上判断越界的逻辑
                var alertView = require('UIAlertView').alloc().init();
                alertView.setTitle('Alert');
                alertView.setMessage('数组下标没有越界');
                alertView.addButtonWithTitle('OK');
                alertView.show();
            }else{
                 var alertView = require('UIAlertView').alloc().init();
                 alertView.setTitle('Alert');
                 alertView.setMessage('数组下标越界');
                 alertView.addButtonWithTitle('OK');
                 alertView.show();
            }
            }
            }, {});