package ru.taiga;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;

import org.kohsuke.args4j.CmdLineException;
import org.kohsuke.args4j.CmdLineParser;
import org.kohsuke.args4j.Option;

public class Main {

    // CLI params
    @Option(name = "-i", aliases = {"--input"}, metaVar = "PATH", usage = "specify a directory")
    private static String inArg;
    private static File inputFile;
    private static Path inputPath;

    @Option(name="-?", aliases={"--help"}, usage="show this message")
    private static boolean help = false;

    private static int totalCount;
    private static int processedCount;

    public static void main(String[] args) throws IOException, EmptyArgumentException {

        CmdLineParser parser = new CmdLineParser(new Main());

        try {
            parser.parseArgument(args);

            if (help) {
                parser.printUsage(System.err);
                System.exit(0);
            }
        } catch (CmdLineException e) {
            e.printStackTrace();
        }

        throwIfEmpty(inArg);

        inputFile = new File(inArg);
        inputPath = inputFile.isFile() ? inputFile.getParentFile().toPath() : inputFile.toPath();


        if (inputFile.isFile()) {
            throw new EmptyArgumentException("A required option was not specified");
        }

        final PathMatcher matcher = FileSystems.getDefault().getPathMatcher("glob:**.*");
        try (DirectoryStream<Path> directoryStream = Files.newDirectoryStream(inputPath, "*.0*")) {
            for (Path file : directoryStream) {
                if (matcher.matches(file.getFileName())) {
                    System.out.println(file.getFileName());
                    extract(file);
                }
            }
        }
        System.out.println("Total count: " + totalCount);
        System.out.println("Processed count: " + processedCount);
    }

    private static void extract(Path file) throws IOException {
        TRex reader = getReader(file.toString());
        ++totalCount;
        if (reader != null) {
            ++processedCount;
        }
    }

    public static TRex getReader(String file) throws IOException {
            TRex reader = TRex.fromFile(file);
            return reader;
    }

    private static void throwIfEmpty(String arg) throws EmptyArgumentException {
        if (isEmptyArg(arg)) {
            throw new EmptyArgumentException("A required option was not specified");
        }
    }

    private static boolean isEmptyArg(String arg) {
        return arg == null || arg.isEmpty();
    }

}
