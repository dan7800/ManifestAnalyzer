﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AndroidCodeAnalyzer
{
    class Commit
    {
        string id;
        string message;
        string authorName;
        string authorEmail;
        DateTime date;
        List<CommitFile> commitFiles;

        public string Id { get => id; set => id = value; }
        public string Message { get => message; set => message = value; }
        public string AuthorName { get => authorName; set => authorName = value; }
        public string AuthorEmail { get => authorEmail; set => authorEmail = value; }
        public DateTime Date { get => date; set => date = value; }
        internal List<CommitFile> CommitFiles { get => commitFiles; set => commitFiles = value; }

        public Commit()
        {
            id = string.Empty;
            message = string.Empty;
            authorEmail = string.Empty;
            authorName = string.Empty;
            commitFiles = new List<CommitFile>();
            date = DateTime.Now;
        }
    }
}
