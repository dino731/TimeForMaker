package main.java.product.model.vo;

public class File {
    private String refNo;
    private String fileName;
    private String fileSavePath;
    private int fileLevel;

    public File() {}

    public File(String refNo, String fileName, String fileSavePath, int fileLevel)
    {
        this.refNo = refNo;
        this.fileName = fileName;
        this.fileSavePath = fileSavePath;
        this.fileLevel = fileLevel;
    }

    public String getRefNo()
    {
        return refNo;
    }

    public void setRefNo(String refNo)
    {
        this.refNo = refNo;
    }

    public String getFileName()
    {
        return fileName;
    }

    public void setFileName(String fileName)
    {
        this.fileName = fileName;
    }

    public String getFileSavePath()
    {
        return fileSavePath;
    }

    public void setFileSavePath(String fileSavePath)
    {
        this.fileSavePath = fileSavePath;
    }

    public int getFileLevel()
    {
        return fileLevel;
    }

    public void setFileLevel(int fileLevel)
    {
        this.fileLevel = fileLevel;
    }

    @Override
    public String toString()
    {
        return "File{" +
                "refNo='" + refNo + '\'' +
                ", fileName='" + fileName + '\'' +
                ", fileSavePath='" + fileSavePath + '\'' +
                ", fileLevel=" + fileLevel +
                '}';
    }
}