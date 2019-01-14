using System.Xml;
using System;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;

namespace QXiuUpdate
{
    public partial class QXiuUpdateSvr : ServiceBase
    {
        public QXiuUpdateSvr()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            Task.Factory.StartNew(UpdateCode);
        }

        protected override void OnStop()
        {
        }

        //更新代码
        private void UpdateCode()
        {
            for (; ; )
            {
                try
                {
                    int updateInterval = 30 * 1000;
                    Process proc = null;
                    string curPath = AppDomain.CurrentDomain.BaseDirectory;
                    proc = new Process();
                    proc.StartInfo.WorkingDirectory = curPath;
                    XmlDocument doc = new XmlDocument();
                    doc.Load(AppDomain.CurrentDomain.BaseDirectory + "config.xml");
                    XmlNodeList nls = doc.DocumentElement.ChildNodes;
                    foreach (XmlElement element in nls)
                    {
                        if ("batch" == element.Name)
                        {
                            proc.StartInfo.FileName = element.InnerText;
                        }
                        else if ("arguments" == element.Name)
                        {
                            proc.StartInfo.Arguments = element.InnerText;
                        }
                        else if ("updateInterval" == element.Name)
                        {
                            updateInterval = int.Parse(element.InnerText);
                        }
                    }
                    proc.Start();
                    proc.WaitForExit();

                    System.Threading.Thread.Sleep(updateInterval);
                }
                catch (Exception)
                {
                    File.WriteAllText(AppDomain.CurrentDomain.BaseDirectory + "update.log", "exception...");
                    throw;
                }
            }
        }
    }
}
