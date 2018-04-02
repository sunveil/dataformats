import java.io.IOException;

public class Main {

    private final static String FILE_NAME = "C:\\Документы\\Проекты\\TAIGA\\Data Formats\\Samples\\hiscore\\10038105.010";
    private final static int DATA_COUNT_TO_VIEW = 10;

    public static void main(String[] args) throws IOException {

        Hiscore hiscore = Hiscore.fromFile(FILE_NAME);

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

}
