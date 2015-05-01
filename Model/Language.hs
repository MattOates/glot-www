module Model.Language where

import Prelude (readsPrec)
import ClassyPrelude.Yesod
import Util.Multiline (multiline)

data Language = Bash |
                C |
                Clojure |
                Cpp |
                Csharp |
                Erlang |
                Fsharp |
                Go |
                Haskell |
                Java |
                Javascript |
                Perl |
                Php |
                Python |
                Ruby |
                Plaintext
                deriving Eq


instance PathPiece Language where
    toPathPiece = pack . show
    fromPathPiece s = Just $ toLanguage s

instance Show Language where
    show Bash = "bash"
    show C = "c"
    show Clojure = "clojure"
    show Cpp = "cpp"
    show Csharp = "csharp"
    show Erlang = "erlang"
    show Fsharp = "fsharp"
    show Go = "go"
    show Haskell = "haskell"
    show Java = "java"
    show Javascript = "javascript"
    show Perl = "perl"
    show Php = "php"
    show Python = "python"
    show Ruby = "ruby"
    show Plaintext = "plaintext"

instance Read Language where
    readsPrec _ value = [(toLanguage $ pack value, value)]

toLanguage :: Text -> Language
toLanguage "bash" = Bash
toLanguage "clojure" = Clojure
toLanguage "cpp" = Cpp
toLanguage "c" = C
toLanguage "csharp" = Csharp
toLanguage "erlang" = Erlang
toLanguage "fsharp" = Fsharp
toLanguage "go" = Go
toLanguage "haskell" = Haskell
toLanguage "javascript" = Javascript
toLanguage "java" = Java
toLanguage "perl" = Perl
toLanguage "php" = Php
toLanguage "python" = Python
toLanguage "ruby" = Ruby
toLanguage _ = Plaintext

allLanguages :: [Language]
allLanguages = [Bash, C, Clojure, Cpp, Csharp, Erlang, Fsharp, Go, Haskell, Java, Javascript, Perl, Php, Plaintext, Python, Ruby]

languageFileExt :: Language -> Text
languageFileExt Bash = "sh"
languageFileExt C = "c"
languageFileExt Clojure = "clj"
languageFileExt Cpp = "cpp"
languageFileExt Csharp = "cs"
languageFileExt Erlang = "erl"
languageFileExt Fsharp = "fs"
languageFileExt Go = "go"
languageFileExt Haskell = "hs"
languageFileExt Java = "java"
languageFileExt Javascript = "js"
languageFileExt Perl = "pl"
languageFileExt Php = "php"
languageFileExt Python = "py"
languageFileExt Ruby = "rb"
languageFileExt Plaintext = "txt"

languageDefaultFname :: Language -> Text
languageDefaultFname Bash = "main." ++ languageFileExt Bash
languageDefaultFname C = "main." ++ languageFileExt C
languageDefaultFname Clojure = "main." ++ languageFileExt Clojure
languageDefaultFname Cpp = "main." ++ languageFileExt Cpp
languageDefaultFname Csharp = "main." ++ languageFileExt Csharp
languageDefaultFname Erlang = "main." ++ languageFileExt Erlang
languageDefaultFname Fsharp = "main." ++ languageFileExt Fsharp
languageDefaultFname Go = "main." ++ languageFileExt Go
languageDefaultFname Haskell = "main." ++ languageFileExt Haskell
languageDefaultFname Java = "Main." ++ languageFileExt Java
languageDefaultFname Javascript = "main." ++ languageFileExt Javascript
languageDefaultFname Perl = "main." ++ languageFileExt Perl
languageDefaultFname Php = "main." ++ languageFileExt Php
languageDefaultFname Python = "main." ++ languageFileExt Python
languageDefaultFname Ruby = "main." ++ languageFileExt Ruby
languageDefaultFname Plaintext = "main." ++ languageFileExt Plaintext

languageIconClass :: Language -> Text
languageIconClass Bash = "icon-prog-bash02"
languageIconClass C = "icon-prog-c"
languageIconClass Clojure = "icon-pl-clojure"
languageIconClass Cpp = "icon-prog-cplusplus"
languageIconClass Csharp = "icon-prog-csharp"
languageIconClass Erlang = "icon-prog-erlang"
languageIconClass Fsharp = "fa fa-code"
languageIconClass Go = "icon-prog-golang02"
languageIconClass Haskell = "icon-prog-haskell"
languageIconClass Java = "icon-prog-java"
languageIconClass Javascript = "icon-prog-nodejs02"
languageIconClass Perl = "icon-prog-perl"
languageIconClass Php = "icon-prog-php02"
languageIconClass Python = "icon-prog-python"
languageIconClass Ruby = "icon-prog-ruby"
languageIconClass Plaintext = "fa fa-file-text-o"

languageAceMode :: Language -> Text
languageAceMode Bash = "ace/mode/sh"
languageAceMode C = "ace/mode/c_cpp"
languageAceMode Clojure = "ace/mode/clojure"
languageAceMode Cpp = "ace/mode/c_cpp"
languageAceMode Csharp = "ace/mode/csharp"
languageAceMode Erlang = "ace/mode/erlang"
languageAceMode Fsharp = "ace/mode/csharp"
languageAceMode Go = "ace/mode/golang"
languageAceMode Haskell = "ace/mode/haskell"
languageAceMode Java = "ace/mode/java"
languageAceMode Javascript = "ace/mode/javascript"
languageAceMode Perl = "ace/mode/perl"
languageAceMode Php = "ace/mode/php"
languageAceMode Python = "ace/mode/python"
languageAceMode Ruby = "ace/mode/ruby"
languageAceMode Plaintext = "ace/mode/plain_text"

languageName :: Language -> Text
languageName Bash = "Bash"
languageName C = "C"
languageName Clojure = "Clojure"
languageName Cpp = "C++"
languageName Csharp = "C#"
languageName Erlang = "Erlang"
languageName Fsharp = "F#"
languageName Go = "Go"
languageName Haskell = "Haskell"
languageName Java = "Java"
languageName Javascript = "Javascript"
languageName Perl = "Perl"
languageName Php = "PHP"
languageName Python = "Python"
languageName Ruby = "Ruby"
languageName Plaintext = "Plaintext"

languageIsRunnable :: Language -> Bool
languageIsRunnable Plaintext = False
languageIsRunnable _ = True

languageDefaultContent :: Language -> String
languageDefaultContent Bash = [multiline|echo Hello World|]
languageDefaultContent C = [multiline|#include <stdio.h>

int main() {
    printf("Hello World!\n");
    return 0;
}|]
languageDefaultContent Clojure = [multiline|(println "Hello World!")|]
languageDefaultContent Cpp = [multiline|#include <iostream>
using namespace std;

int main() {
    cout << "Hello World!";
    return 0;
}|]
languageDefaultContent Csharp = [multiline|using System;

class MainClass {
    static void Main() {
        Console.WriteLine("Hello World!");
    }
}|]
languageDefaultContent Erlang = [multiline|% escript will ignore the first line

main(_) ->
    io:format("Hello World!~n").|]
languageDefaultContent Fsharp = [multiline|printfn "Hello World!"|]
languageDefaultContent Go = [multiline|package main

import (
    "fmt"
)

func main() {
    fmt.Println("Hello World!")
}|]
languageDefaultContent Haskell = [multiline|main = putStrLn "Hello World!"|]
languageDefaultContent Java = [multiline|class Main {
    public static void main(String[] args) {
        System.out.println("Hello World!");
    }
}|]
languageDefaultContent Javascript = [multiline|console.log("Hello World!");|]
languageDefaultContent Perl = [multiline|print "Hello World!\n";|]
languageDefaultContent Php = [multiline|<?php

echo "Hello World\n";|]
languageDefaultContent Python = [multiline|print("Hello World!")|]
languageDefaultContent Ruby = [multiline|puts "Hello World!"|]
languageDefaultContent Plaintext = [multiline|Hello World!|]
