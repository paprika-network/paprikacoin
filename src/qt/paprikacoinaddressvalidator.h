// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017-2019 The Raven Core developers
// Copyright (c) 2020-2021 The Paprikacoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef PAPRIKA_QT_PAPRIKAADDRESSVALIDATOR_H
#define PAPRIKA_QT_PAPRIKAADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class PaprikacoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit PaprikacoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** paprikacoin address widget validator, checks for a valid paprikacoin address.
 */
class PaprikacoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit PaprikacoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // PAPRIKA_QT_PAPRIKAADDRESSVALIDATOR_H
