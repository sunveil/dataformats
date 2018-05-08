package ru.taiga;

import java.io.File;
import java.io.IOException;

import org.kohsuke.args4j.CmdLineException;
import org.kohsuke.args4j.CmdLineParser;
import org.kohsuke.args4j.Option;

public class Main {

    private final static int DATA_COUNT_TO_VIEW = 10;

    // CLI params
    @Option(name = "-i", aliases = {"--input"}, metaVar = "PATH", usage = "specify a file")
    private static String inArg;
    private static File inputFile;

    @Option(name="-?", aliases={"--help"}, usage="show this message")
    private static boolean help = false;

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

        if (!inputFile.isFile()) {
            throw new EmptyArgumentException("A required option was not specified");
        }

        Hiscore hiscore = Hiscore.fromFile(inputFile.toPath().toString());

        System.out.println("Magic: " + hiscore.hdr().magic());
        System.out.println("Size: " + hiscore.hdr().sz());
        System.out.println("Event number: " + hiscore.hdr().eventNumber());
        System.out.println("Stop position: " + hiscore.hdr().eventNumber());
        System.out.println(String.format("H %d: M %d: S %d: DNS %d: MKS %d: MLS %d",
                hiscore.hdr().time().h(),
                hiscore.hdr().time().m(),
                hiscore.hdr().time().s(),
                hiscore.hdr().time().dns(),
                hiscore.hdr().time().mks(),
                hiscore.hdr().time().mls()));
        System.out.println("IP: " + hiscore.hdr().ip());
        System.out.println("Station number: " + hiscore.hdr().stationNumber());

        for (int i = 0; i < 9; i++) {
            Hiscore.DataBlock data = hiscore.data().get(i);
            System.out.println("Data block: " + i);
            System.out.println("Offset: " + data.offset());
            System.out.println("Length: " + data.len());
            int size = hiscore.data().size();
            int n = size > DATA_COUNT_TO_VIEW ? DATA_COUNT_TO_VIEW : size;
            for (int j = 0; j < n; j++) {
                System.out.print(data.data().get(j) + " ");
            }
            System.out.println();
        }

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
