module Model.Language where

import Prelude (
    Maybe(..),
    Show,
    Read,
    Eq,
    show,
    reads,
    readsPrec,
    take,
    drop,
    length,
    (.),
    ($),
    (==))
import Data.Text (pack, unpack, Text)
import Yesod

data Language = Bash |
                C |
                Cpp |
                Erlang |
                Go |
                Haskell |
                Java |
                Javascript |
                Perl |
                Php |
                Python |
                Ruby
                deriving Eq


instance PathPiece Language where
    toPathPiece = pack . show
    fromPathPiece s =
        case reads $ unpack s of
            (lang, _):_ -> Just $ lang
            [] -> Nothing

instance Show Language where
    show Bash = "bash"
    show C = "c"
    show Cpp = "cpp"
    show Erlang = "erlang"
    show Go = "go"
    show Haskell = "haskell"
    show Java = "java"
    show Javascript = "javascript"
    show Perl = "perl"
    show Php = "php"
    show Python = "python"
    show Ruby = "ruby"

instance Read Language where
    readsPrec _ value =
        tryParse [
            ("bash", Bash),
            ("cpp", Cpp),
            ("c", C),
            ("erlang", Erlang),
            ("go", Go),
            ("haskell", Haskell),
            ("javascript", Javascript),
            ("java", Java),
            ("perl", Perl),
            ("php", Php),
            ("python", Python),
            ("ruby", Ruby)
        ] where
            tryParse [] = []
            tryParse ((attempt, result):xs) =
                if (take (length attempt) value) == attempt
                then [(result, drop (length attempt) value)]
                else tryParse xs


allLanguages :: [Language]
allLanguages = [Bash, C, Cpp, Erlang, Go, Haskell, Java, Javascript, Perl, Php, Python, Ruby]

languageIconClass :: Language -> Text
languageIconClass Bash = "icon-prog-bash02"
languageIconClass C = "icon-prog-c"
languageIconClass Cpp = "icon-prog-cplusplus"
languageIconClass Erlang = "icon-prog-erlang"
languageIconClass Go = "icon-prog-golang02"
languageIconClass Haskell = "icon-prog-haskell"
languageIconClass Java = "icon-prog-java"
languageIconClass Javascript = "icon-prog-nodejs02"
languageIconClass Perl = "icon-prog-perl"
languageIconClass Php = "icon-prog-php02"
languageIconClass Python = "icon-prog-python"
languageIconClass Ruby = "icon-prog-ruby"

languageAceMode :: Language -> Text
languageAceMode Bash = "ace/mode/sh"
languageAceMode C = "ace/mode/c_cpp"
languageAceMode Cpp = "ace/mode/c_cpp"
languageAceMode Erlang = "ace/mode/erlang"
languageAceMode Go = "ace/mode/golang"
languageAceMode Haskell = "ace/mode/haskell"
languageAceMode Java = "ace/mode/java"
languageAceMode Javascript = "ace/mode/javascript"
languageAceMode Perl = "ace/mode/perl"
languageAceMode Php = "ace/mode/php"
languageAceMode Python = "ace/mode/python"
languageAceMode Ruby = "ace/mode/ruby"

languageName :: Language -> Text
languageName Bash = "Bash"
languageName C = "C"
languageName Cpp = "C++"
languageName Erlang = "Erlang"
languageName Go = "Go"
languageName Haskell = "Haskell"
languageName Java = "Java"
languageName Javascript = "Javascript"
languageName Perl = "Perl"
languageName Php = "Php"
languageName Python = "Python"
languageName Ruby = "Ruby"
