/*
 * IPWorks ZIP 2022 .NET Edition - Sample Project
 *
 * This sample project demonstrates the usage of IPWorks ZIP in a 
 * simple, straightforward way. It is not intended to be a complete 
 * application. Error handling and other checks are simplified for clarity.
 *
 * www.nsoftware.com/ipworkszip
 *
 * This code is subject to the terms and conditions specified in the 
 * corresponding product license agreement which outlines the authorized 
 * usage and restrictions.
 * 
 */

using System.Collections.Generic;
﻿using System;
using System.IO;
using System.Threading.Tasks;
using nsoftware.async.IPWorksZip;

class jarcreatorDemo
{
  private static Jar jar = new nsoftware.async.IPWorksZip.Jar();

  static async Task Main(string[] args)
  {
    if (args.Length < 4)
    {
      Console.WriteLine("usage: jarcreator /n name /p path [/r]\n");
      Console.WriteLine("  name     the name of the archive to create");
      Console.WriteLine("  path     the files to compress");
      Console.WriteLine("  /r       whether to recurse subdirectories (optional)");
      Console.WriteLine("\nExample: jarcreator /n test.jar /p c:\\mydir\\*.class\n");
    }
    else
    {
      try
      {
        Dictionary<string, string> myArgs = ConsoleDemo.ParseArgs(args);

        jar.ArchiveFile = myArgs["n"];
        jar.RecurseSubdirectories = myArgs.ContainsKey("r");
        await jar.IncludeFiles(myArgs["p"]);

        Console.WriteLine("Compressing...");
        await jar.Compress();
        Console.WriteLine("Archive compressed.");
      }
      catch (IPWorksZipException ex)
      {
        Console.WriteLine($"IPWorks ZIP exception thrown: {ex.Code} [{ex.Message}].");
      }
      catch (Exception ex)
      {
        Console.WriteLine(ex.Message);
      }
    }
  }
}


class ConsoleDemo
{
  public static Dictionary<string, string> ParseArgs(string[] args)
  {
    Dictionary<string, string> dict = new Dictionary<string, string>();

    for (int i = 0; i < args.Length; i++)
    {
      // If it starts with a "/" check the next argument.
      // If the next argument does NOT start with a "/" then this is paired, and the next argument is the value.
      // Otherwise, the next argument starts with a "/" and the current argument is a switch.

      // If it doesn't start with a "/" then it's not paired and we assume it's a standalone argument.

      if (args[i].StartsWith("/"))
      {
        // Either a paired argument or a switch.
        if (i + 1 < args.Length && !args[i + 1].StartsWith("/"))
        {
          // Paired argument.
          dict.Add(args[i].TrimStart('/'), args[i + 1]);
          // Skip the value in the next iteration.
          i++;
        }
        else
        {
          // Switch, no value.
          dict.Add(args[i].TrimStart('/'), "");
        }
      }
      else
      {
        // Standalone argument. The argument is the value, use the index as a key.
        dict.Add(i.ToString(), args[i]);
      }
    }
    return dict;
  }

  public static string Prompt(string prompt, string defaultVal)
  {
    Console.Write(prompt + (defaultVal.Length > 0 ? " [" + defaultVal + "]": "") + ": ");
    string val = Console.ReadLine();
    if (val.Length == 0) val = defaultVal;
    return val;
  }
}