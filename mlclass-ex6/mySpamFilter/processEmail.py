import re, sys, os


def loadVocab(path):
    vocab = {}
    with open(path) as f:
        vocab = {line.split()[1]: int(line.split()[0]) for line in f.readlines()}

    return vocab;

def processEmail(emailContent):
    #lower case
    emailContent = emailContent.lower()
    
    #strip all html
    emailContent = re.sub(r'<[^<>]>', ' ', emailContent, flags = re.M)

    #handle numbers
    emailContent = re.sub(r'[0-9]+', 'number', emailContent, flags = re.M)

    #handle urls
    emailContent = re.sub(r'(http|https)://[^\s]*', 'httpaddr', emailContent, flags = re.M)

    #handle email address
    emailContent = re.sub(r'[^\s]+@[%\s]+', 'emailaddr', emailContent, flags = re.M)

    #handle $ sign
    emailContent = re.sub(r'[$]+', 'dollar', emailContent, flags = re.M)

    return emailContent

def emailFeatures(emailContent, vocab):
    #convert to vector
    v = [0 for i in range(len(vocab))]
    
    ######test############3
    #for w in emailContent.split():
    #    if w in vocab:
    #        print w
    
    ######test############3
    for i in map(lambda x: vocab[x] - 1 if x in vocab else -1, emailContent.split()):
        if i != -1:
            v[i] = 1
    
    return v

def handleEmails(emailPath, isSpam, vocab, savePath):
    fs = [os.path.join(emailPath, f) for f in os.listdir(emailPath) \
        if os.path.isfile(os.path.join(emailPath, f))]
    
    saveFile = open(savePath, 'wb')
    for f in fs:
        print f
        fh = open(f, 'rb')
        emailContent = processEmail(fh.read())
        email_words_vector = emailFeatures(emailContent, vocab)
        def serial_str(x, y): return '%s,%d' % (x, y)
        v_serial = reduce(serial_str,  email_words_vector)
        if isSpam:
            v_serial = '1,%s\n' % v_serial
        else:
            v_serial = '0,%s\n' % v_serial
        saveFile.write(v_serial)
        fh.close()

    saveFile.close()
    

if __name__ == '__main__':
    if len(sys.argv) < 4:
        print 'usage:%s <vocab> <email path> <isSpam> <save path>' % sys.argv[0]
        sys.exit()

    vocab = loadVocab(sys.argv[1])
    #print vocab
    #process email
    
    #emailContent = processEmail(open(sys.argv[1],'rb').read())
    
    #email_words_vector = emailFeatures(emailContent, vocab)
    
    #print email_words_vector

    handleEmails(sys.argv[2], int(sys.argv[3]), vocab, sys.argv[4])

    
